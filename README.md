# arch-spatula의 NEOVIM Setup

저의 개인적인 neovim 설정입니다.

neovim 에디터로 주로 C언어처럼 GC가 없는 언어 위주로 다룰 때 사용하고자 합니다.

## 설치

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

```sh
git clone https://github.com/arch-spatula/neovim-setup.git ~/.config/nvim --depth 1 && nvim
```

제가 설정한 neovim을 위 명령으로 ~~멀웨어와 함께~~ 설치할 수 있습니다.

<!-- @todo: 설치한 LSP 목록 나열하기 -->

