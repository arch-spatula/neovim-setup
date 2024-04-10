return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})

		-- NOTE: ``, "", '', <>, {}, [], (),  // 입력시 자동 감싸기
		-- 참고: https://www.reddit.com/r/neovim/comments/18x6xk9/introducing_visualsurroundnvim/
		local v_chars = { "(", ")", "[", "]", "<", ">", "{", "}", "'", '"', "`", "/" }
		for _, char in pairs(v_chars) do
			vim.keymap.set("v", "<leader>" .. char, "<Plug>(nvim-surround-visual)" .. char, { desc = "wrap " .. char })
		end

		vim.keymap.set("v", "<leader>t", "<Plug>(nvim-surround-visual)t", { desc = "wrap [t]age" })
		vim.keymap.set("v", "<leader>f", "<Plug>(nvim-surround-visual)f", { desc = "wrap [f]unction" })

		-- TODO: ****는 비주얼 모드에서 *을 선택하는 것으로 앞뒤에 2개 추가하기
	end,
}
