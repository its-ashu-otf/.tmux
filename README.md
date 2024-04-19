# Versitile Tmux
This is a simple tmux configuration enabling to have arbitrarily many nested tmux sessions.

# Installing in `~`:

```bash
cd
git clone https://github.com/its-ashu-otf/.Tmux.git
ln -s -f .Tmux/.tmux.conf
cp .Tmux/.tmux.conf.local .
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


