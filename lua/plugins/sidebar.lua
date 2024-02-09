-- 사이드바
return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		-- 사이드 펴기 단축키
		vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle, {})
		vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFocus, {})
	end,
	config = function()
		require("nvim-tree").setup {
		}
	end,
}
