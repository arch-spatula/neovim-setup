return {
	"mbbill/undotree",
	config = function()

		-- window 간 이동할 때는 mac 기준 ctrl + w -> h, j, k, l 으로 이동
		-- toggle을 누리기 때문에 leader(스페이스바)를 누르는 동안 u를 눌러야 열고 닫을 수 있음
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
