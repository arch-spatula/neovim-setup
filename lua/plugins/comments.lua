--local M = {}

--M.comment = {
--plugin = true,

---- toggle comment in both modes
--n = {
--["<leader>/"] = {
--function()
--require("Comment.api").toggle.linewise.current()
--end,
--"Toggle comment",
--},
--},

--v = {
--["<leader>/"] = {
--"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--"Toggle comment",
--},
--},
--}

--return M

-- 저장에 자동 포맷팅
-- require 'plugins.autoformat',
-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:

---- 주석처리하는 방법
--{
--'numToStr/Comment.nvim',
--opts = {
---- add any options here
--padding = true,
---- sticky = true,
--toggler = {
-----Line-comment toggle keymap
--line = "gcc",
-----Block-comment toggle keymap
--block = "gbc",
--},
--opleader = {
-----Line-comment keymap
--line = "<leader>_",
-----Block-comment keymap
--block = "<leader>_",
--},
--mappings = {
-----Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
--basic = true,
-----Extra mapping; `gco`, `gcO`, `gcA`
--extra = true,
--},
--},
--lazy = false,
--},

return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})

			vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "[f]ind [t]odos" }) -- todo-comments.nvim으로 사용

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
	-- TODO: numToStr/Comment.nvim 으로 교체
	--{
	--"numToStr/Comment.nvim",
	--opts = {
	---- add any options here
	--},
	--lazy = false,
	--},
	{
		"preservim/nerdcommenter",
		config = function()
			-- TODO: leader + / 에 주석 처리 -> 아직 완성 못함 지금은 leader + c 로 주석처리함
			local modes = { "n", "v" }
			for i in pairs(modes) do
				vim.keymap.set(
					modes[i],
					-- NOTE: Warp pad에서 사용할 때 <C-/>이 단축기 접근으로 기본설정이 되어 있음
					"<leader>gc",
					':call nerdcommenter#Comment(0, "toggle")<CR>',
					{ noremap = true, silent = true }
				)
			end
		end,
	},

}
