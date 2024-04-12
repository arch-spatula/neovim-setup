-- WARN: preview는 너무 작으면 안보임 1920 * 1080 해상도에서 시도하면 보임 https://www.reddit.com/r/neovim/comments/nasx24/telescope_doesnt_show_preview/
-- '<leader>fh' telescope.nvim 검색으로 문서를 확인하기 바랍니다.
-- https://github.com/cpow/neovim-for-newbs/blob/main/lua/plugins/telescope.lua 을 참고함
return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				-- 아래 주석 한번 걸어보면 preview ui가 생김
				-- build = "make",
				-- cond = function()
				-- return vim.fn.executable("make") == 1
				-- end,
			},
		},
		config = function()
			-- code action telescope 조합 설정
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			-- TODO: codeactions 설정하기
			-- TODO: nvchad mapping 적용하기

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }

			-- 검색기 활성화
			local builtin = require("telescope.builtin")
			-- NOTE: kickstart.nvim을 활용함
			-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]ile" }) -- 파일이름으로 검색
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[f]ind [g]rep" }) -- 단어 검색
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[f]ind current [w]ord" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" }) -- buffer 탭 검색
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[f]ind [k]eymaps" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[f]ind [s]elect telescope" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[f]ind [r]esume" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[f]ind recent files ("." for repeat)' })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[f]ind [g]it file" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = " [/] Fuzzily search in current buffer" })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[f]ind [/] in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[f]ind [n]eovim files" })

			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
