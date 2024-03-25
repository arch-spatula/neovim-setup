-- :Mason 명령으로 확인하지만 설정은 코드로 합니다.
return {
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonInstallAll",
			"MasonUpdate",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		config = function()
			require("mason").setup({})
			-- https://github.com/NvChad/NvChad/blob/e5f8a38ae3d6b3bedf68f29b0e96dad7a4ca2da5/lua/nvchad/plugins/init.lua
			-- NvChad 레포에서 제공하는 MasonInstallAll 커맨드를 구현함
			-- 처음부터 확정 설치를 할수 없음 MasonInstallAll로 코드로 설정을 명시하게 됨
			local ensure_installed = {
				"stylua",
				"spell",
				"codespell",
				"prettierd",
				"gospel",
				--"gofumpt",
				--"biome",
				"pylint",
				"cspell",
			}

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if ensure_installed and #ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
				end
			end, { desc = "Mason Install All package" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- 최초 설치부터 자동 지원함
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"gopls",
					"marksman",
					-- JS & TS
					"html",
					"cssls",
					"eslint",
					"tsserver",
					"volar",
				},
				--automatic_installation = true
			})
		end,
	},
	-- :LspInfo 로 LSP 설정 확인 가능
	-- :h vim.lsp.buf 현재 버퍼의 도음말도 찾는 것이 가능합니다.
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- @todo lsp attach hook 적용
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,

				-- Multiple different client offset_encodings detected 경고 제거
				-- https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})

			-- JS & TS

			local secret = os.getenv("VUE_LSP_PATH")
			-- Version 2 stop working with nvim lsp
			-- https://github.com/vuejs/language-tools/issues/3925
			-- https://github.com/williamboman/mason-lspconfig.nvim/issues/371#issuecomment-1988153959
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
			-- npm install -g @vue/language-server # vue lsp를 전역으로 설치
			-- npm list -g # 이 명령으로 설치된 경로를 알아낼 수 있음
			-- .zshrc, bash, posh rc 파일에 설치한 @vue/language-server의 경로를 VUE_LSP_PATH에 설정할 것.
			-- VUE_LSP_PATH="명령으로_알아낸_설치_경로/node_modules/@vue/language-server"
			-- 모든 해결책이 소용없다면 다음 명령 활용
			-- :MasonInstall vue-language-server@1.8.27
			if secret == nil then
				print("VUE LSP PATH not set")
				lspconfig.tsserver.setup({
					capabilities = capabilities,
				})
			else
				lspconfig.tsserver.setup({
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = secret,
								languages = {
									"typescript",
									"javascript",
									"vue",
								},
							},
						},
					},
					filetypes = {
						"javascript",
						"typescript",
						"vue",
					},
					capabilities = capabilities,
				})
			end

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			-- Go
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- 참고. <leader>gf로 포맷팅은 formatter에 위치함

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[k] hover" })
			-- 권장 코드 수정
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[g]oto [d]eclaration" })

			-- Jump to the definition of the word under your cursor.
			--  This is where a variable was first declared, or where a function is defined, etc.
			--  To jump back, press <C-T>.
			--vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, { desc = "[g]oto [d]efinition" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition" })

			-- Jump to the implementation of the word under your cursor.
			--  Useful when your language has ways of declaring types without an actual implementation.
			--vim.keymap.set("n", "gi", require('telescope.builtin').lsp_implementations, { desc = "[g]oto [i]mplementation" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]oto [i]mplementation" })

			-- Jump to the type of the word under your cursor.
			--  Useful when you're not sure what type a variable is and you want to see
			--  the definition of its *type*, not where it was *defined*.
			--vim.keymap.set("n", "go", require('telescope.builtin').lsp_type_definitions, { desc = "[g]oto [t]ype [d]efinition" })
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "[g]oto [t]ype [d]efinition" })

			-- Rename the variable under your cursor
			--  Most Language Servers support renaming across files, etc.
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })

			-- Fuzzy find all the symbols in your current document.
			--  Symbols are things like variables, functions, types, etc.
			vim.keymap.set(
				"n",
				"<leader>ds",
				require("telescope.builtin").lsp_document_symbols,
				{ desc = "[d]ocument [s]ymbols" }
			)

			-- Fuzzy find all the symbols in your current workspace
			--  Similar to document symbols, except searches over your whole project.
			vim.keymap.set(
				"n",
				"<leader>ws",
				require("telescope.builtin").lsp_dynamic_workspace_symbols,
				{ desc = "[w]orkspace [s]ymbols" }
			)

			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[g]oto [r]eferences" })
			--vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[g]oto [r]eferences" })

			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "[g]oto [s]ignature help" })
		end,
	},
}
