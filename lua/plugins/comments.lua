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
		"preservim/nerdcommenter",
		config = function()
			-- leader + / 에 주석 처리 -> 아직 완성 못함 지금은 leader + c 로 주석처리함
			local modes = { 'n', 'v' }
			for i in pairs(modes) do
				vim.keymap.set(modes[i], '<leader>c', ':call nerdcommenter#Comment(0, "toggle")<CR>',
					{ noremap = true, silent = true })
			end
		end
	}
}
