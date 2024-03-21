return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
		-- 위는 참고한 레포입니다.
		require("lualine").setup({
			options = { component_separators = "", section_separators = { left = "", right = "" } },
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				--lualine_b = { "filename", "branch" },
				--lualine_c = {
				--"%=", [> add your center compoentnts here in place of this comment <]
				--},
				--lualine_x = {},
				--lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
