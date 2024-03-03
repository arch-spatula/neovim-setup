return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- 공통
				null_ls.builtins.completion.spell,

				--lua
				null_ls.builtins.formatting.stylua,

				-- JavaScript & TypeScript
				--null_ls.builtins.diagnostics.eslint,
				--eslint_language_server으로 대체
				null_ls.builtins.formatting.prettierd,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
