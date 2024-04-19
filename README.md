# Versitile Tmux
This is a simple tmux configuration enabling to have arbitrarily many tmux sessions with fast and easy accesibility.

![tmux-logo-large](https://github.com/its-ashu-otf/.Tmux/assets/85825366/602ebf43-2f0e-45e0-bd4d-1245823223fa)

# Installing in `~`:

```bash
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

# Shortcuts
* `Ctrl + d`: Kill the current active window & pane
* `Ctrl + shift + c`: copy to os clipboard
* `Ctrl + shift + v`: paste to os clipboard
* `Ctrl + a`: My prefix key
* `Ctrl + t`: create a new window
* `Ctrl + a, Ctrl + s`: create a new nested tmux session
* `Ctrl + a, Ctrl + f`: list all sessions
* `Ctrl + a, A`: rename current window
* `Alt + Right`: move to the next window of the current row
* `Alt + Left`: move to the previous window of the current row
* `Alt + Up`: move to the inner tmux session
* `Alt + Down`: move to the outer tmux session


