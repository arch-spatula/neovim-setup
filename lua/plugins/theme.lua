return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		-- catppuccin 컬러 태마 설정
		vim.cmd.colorscheme "catppuccin-mocha"
	end
}
