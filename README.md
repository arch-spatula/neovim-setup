# arch-spatula의 NEOVIM Setup

![neovim](https://private-user-images.githubusercontent.com/84452145/296395019-15086b1e-0167-459e-b997-49048fd77585.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDUxMDUxMDQsIm5iZiI6MTcwNTEwNDgwNCwicGF0aCI6Ii84NDQ1MjE0NS8yOTYzOTUwMTktMTUwODZiMWUtMDE2Ny00NTllLWI5OTctNDkwNDhmZDc3NTg1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAxMTMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMTEzVDAwMTMyNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTJiMWVkZDA0MjM2OTM1Y2ZiMTI1ZmY4ZWFiY2U0YmU4ZmMzMjAxOThjZWJlMTk2N2NjODk2MTJlMjkxNGNkZjgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.NaHRpXKDeDwIEMG-RnIghzjCMCrtXlIUhU-GHT-lirE)

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

## 터미널

[warp pad](https://www.warp.dev/) 터미널을 사용합니다.

<!-- @todo: 설치한 LSP 목록 나열하기 -->

