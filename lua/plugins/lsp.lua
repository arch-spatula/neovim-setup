-- :Mason 명령으로 확인하지만 설정은 코드로 합니다.
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			-- @todo "stylua" 같은 포맷터 ensure_installed 처리하기
			require("mason").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"cssls",
					"eslint",
					"tsserver",
					"html",
					"volar",
				},
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
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			-- @todo 키맵 추가
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
