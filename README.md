# Versitile Tmux
This is a simple tmux configuration enabling to have arbitrarily many tmux sessions with fast and easy accesibility.

![tmux-logo-large](https://github.com/its-ashu-otf/.Tmux/assets/85825366/602ebf43-2f0e-45e0-bd4d-1245823223fa)

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/its-ashu-otf/.tmux/main/setup_tmux.sh | bash
```

## To Start Tmux simultaneosly with Terminal

Add this command to your terminal profile 

```bash
/usr/bin/zsh -ilc "tmux attach || tmux new"
```
For Qterminal in Kali-Linux

```bash
qterminal -e "zsh -ilc 'tmux attach || tmux new'"
```

## Features

- Makes tmux using a bit friendly :)
- Navigating is easier
- Easy and fast session change
- Cross platform clipboard copy paste works


# Shortcuts

* `Ctrl + a, z`: Zoom in/out in current window
* `Ctrl + d`: Kill the current active window & pane
* `Ctrl + shift + c`: copy to os clipboard
* `Ctrl + shift + v`: paste to os clipboard
* `Ctrl + a`: My prefix key
* `Ctrl + t`: create a new window
* `Ctrl + a, s`: create a new nested tmux session
* `Ctrl + a, f`: Find windows
* `Ctrl + a, A`: rename current window
* `Alt + Right`: move to the next window of the current row
* `Alt + Left`: move to the previous window of the current row
* `Alt + Up`: move to the inner tmux session
* `Alt + Down`: move to the outer tmux session



