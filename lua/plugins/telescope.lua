--  '<leader>fh' telescope.nvim 검색으로 문서를 확인하기 바랍니다.
return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			-- 아래 주석 한번 걸어보면 preview ui가 생김
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	init = function()
		-- 검색기 활성화
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- 파일이름으로 검색
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- 단어 검색
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})  -- buffer 탭 검색
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
	end
}
