return {
	{
		-- :TSInstallInfo 로 설치 정보 확인
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				-- 하이라이트할 언어 추가
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",

					-- for system programming
					"c",
					"cpp",
					"rust",
					"zig",

					-- JS & TS
					"html",
					"css",
					"javascript",
					"typescript",
					"vue",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/playground",
		config = function()
			vim.keymap.set("n", "<leader>tsp", vim.cmd.TSPlaygroundToggle, { desc = "[t]ree[s]itter [p]laygroundToggle" })
		end,
	},
}
