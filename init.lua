-- 줄번호 표시하게 만들기
vim.wo.number = true
-- 현재 줄기준으로 표시
vim.wo.relativenumber = true

-- 1 tab을 4 space로 변환
vim.opt["tabstop"] = 2
vim.opt["shiftwidth"] = 2

-- 2칸
vim.opt["numberwidth"] = 2

-- 클립보드 공유
vim.o.clipboard = "unnamedplus"

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazyvim 플러그인 설치
-- :Lazy 명령어로 플러그인 설치여부를 확인할 수 있음
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 스페이스바 + e + x 으로 vim 탐색
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

require("lazy").setup("plugins")

-- TODO: thePrimagen keymap
-- TODO: 디버거 추가
-- TODO: 저장에 자동 포멧팅 설정
-- TODO: 화면 분할(커맨드라인 & 다른 버퍼)
-- TODO: README.md 에 설치한 언어 알려주기
