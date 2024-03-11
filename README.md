# arch-spatula의 NEOVIM Setup

<div style="text-align:center" align="center">
  <div>
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠟⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡴⠟⠁⠀⠀⠻⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⠶⠶⣦⣤⣤⣠⡴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠋⠁⠀⠀⠀⠀⢸⡌⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠶⣤⣀⠀⠀⠀⢀⣠⣤⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⢀⡴⠗⠒⠊⠁⠀⠒⠤⢤⣀⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠶⠟⠛⠉⣿⠀⠀⠀
  ⣀⡀⠀⠀⣠⣶⠋⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠁⠀⠀⢠⣶⡆⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀⠀
  ⠉⠉⣻⠿⢡⡇⠀⠀⠀⠀⠀⠀⠀⣠⣾⠋⠀⠀⠀⠀⠈⠉⠁⠘⠷⠶⢷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀
  ⢀⡼⠁⠀⠈⢷⡦⠤⠤⠤⠤⠔⢋⣿⠿⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⢠⣿⡆⠀⠀⠀⠀⠀⣀⣠⡴⠀⠀⣿⠀⠀⠀⠀
  ⢾⡇⢀⠀⠀⠈⢳⣤⠤⠤⠤⠔⠋⠁⠀⠀⠈⠉⠙⠛⠓⠶⠦⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢀⣴⠟⠉⠀⠀⠀⠀⠙⢷⡀⠀⠀
  ⣸⠁⠀⠙⠢⣀⢈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠲⠶⢤⣤⣤⣀⡤⠖⠛⠁⡄⠀⠀⠀⠀⠀⠀⠈⣷⠀⠀
  ⢹⡀⠀⠀⢒⣒⣸⡷⢶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⢱⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀
  ⠘⣇⠀⠳⣆⣀⣉⣹⣾⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⢄⡀⠀⠀⠀⣀⡤⠶⠶⠶⠶⢧⣀⣀⠀⠀⣀⡤⠟⣦⡀⠀⠀⠀⠓⠒⣶⣿⣤
  ⠀⣿⡀⡀⢀⣈⠉⢉⣿⠞⠁⠀⠀⠀⠀⢀⣤⠾⠿⠛⠓⠒⠛⠒⠒⠩⣁⣀⣀⠀⠀⠀⠀⢀⡠⠋⠀⠀⠀⠀⠈⠻⠶⢶⣤⣤⡾⠏⠀⠈
  ⠀⡘⣷⣼⡀⣠⢌⣽⠇⠀⠀⠀⠀⠀⠀⢈⡧⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⢀⡠⠒⢀⣠⡴⠛⠋⠁⠀⠀⠀⠀
  ⠀⠀⠈⠙⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠉⢷⡆⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢉⣉⡠⠴⠿⠓⠚⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠈⢠⠄⠀⠀⠀⠀⠀⠀⠀⠘⠷⣦⣀⣀⣠⣤⡶⠶⠛⠓⠒⠒⠒⠛⠓⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢫⠭⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  </div>
</div>

저의 개인적인 neovim 설정입니다.

neovim 에디터로 주로 C언어처럼 GC가 없는 언어 위주로 다룰 때 사용하고자 합니다.

## 설치

```sh
# Linux / Macos (unix)
git clone https://github.com/arch-spatula/neovim-setup.git ~/.config/nvim --depth 1 && nvim
```

```sh
# Windows PowerShell 관리자 모드
# nvim 커맨드는 따로 해주세요
git clone https://github.com/arch-spatula/neovim-setup.git $ENV:USERPROFILE\AppData\Local\nvim --depth 1
```

제가 설정한 neovim을 위 명령으로 ~~멀웨어와 함께~~ 설치할 수 있습니다.

### 삭제

```sh
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

```sh
# Window PowerShell 관리자 모드
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

먼저 기존 neovim을 삭제하기 바랍니다.

### experimental 버전 및 편집

공개되고 작업 중인 원격 브랜치로 변경을 시도할 수 있습니다.

```sh
# Linux / Macos (unix)
git clone https://github.com/arch-spatula/neovim-setup ~/.config/nvim/ && cd .config/nvim && nvim
```

git 히스토리를 가져오고 작업을 위한 clone 방식입니다.

```sh
# Windows PowerShell 관리자 모드
# nvim 커맨드는 따로 해주세요
git clone https://github.com/arch-spatula/neovim-setup.git $ENV:USERPROFILE\AppData\Local\nvim
```

```sh
cd # 루트로 이동
cd $ENV:USERPROFILE\AppData\Local\nvim
```

윈도우는 C 드라이브부터 시작해서 `AppData\Local\nvim`를 접근하기 바랍니다.

## Mason 목록

<!-- @todo: 설치한 LSP 목록 나열하기 -->

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

- 맥은 [warp pad](https://www.warp.dev/) 터미널을 사용합니다.
<!--- 원도우는 [warp pad](https://www.warp.dev/) 터미널을 사용합니다.-->
