# arch-spatula의 NEOVIM Setup

저의 개인적인 neovim 설정입니다.

neovim 에디터로 주로 C언어처럼 GC가 없는 언어 위주로 다룰 때 사용하고자 합니다.

## 설치

```sh
git clone https://github.com/arch-spatula/neovim-setup.git ~/.config/nvim --depth 1 && nvim
```

제가 설정한 neovim을 위 명령으로 ~~멀웨어와 함께~~ 설치할 수 있습니다.

### 삭제

```sh
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

```sh
# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

먼저 기존 neovim을 삭제하기 바랍니다.

### 편집

```sh
git clone https://github.com/arch-spatula/neovim-setup ~/.config/nvim/ && cd .config/nvim && nvim
```

git 히스토리를 가져오고 작업을 위한 clone 방식입니다.

## Mason 목록

```
clang-format
clangd
codespell
cpplint
cspell
lua-language-server lua_ls
marksman
mdformat
rust-analyzer rust_analyzer
vim-language-server vimls
```

나중에 추가될 수 있습니다.

## 터미널

[warp pad](https://www.warp.dev/) 터미널을 사용합니다.

<!-- @todo: 설치한 LSP 목록 나열하기 -->

