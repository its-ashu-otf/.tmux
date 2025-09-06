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

## Advanced Features

- **Dual Prefix Support:** Use both `Ctrl + b` (default) and `Ctrl + a` (GNU Screen style) as prefix keys.
- **Session Management:** Fast session creation, switching, and finding with custom keybindings.
- **Window & Pane Navigation:** Intuitive navigation and resizing using Alt, Shift, and Ctrl key combinations.
- **Context-Aware Pane Navigation:** Shift+Arrow keys intelligently navigate panes, with special handling for nano editor.
- **Clipboard Integration:** Seamless copy-paste support for Linux (xsel/xclip), macOS (pbcopy), Windows (clip.exe), and Wayland (wl-copy).
- **Mouse Toggle:** Instantly enable or disable mouse support with a keybinding.
- **Maximize/Zoom Panes:** Quickly maximize or zoom panes for focused work.
- **Customizable Theming:** Easily switch between color themes and highlight focused panes.
- **Automatic Window Renaming:** Windows automatically rename to reflect the current program.
- **Extended Key Support:** Enhanced key handling for terminals like mintty and iTerm.
- **History Management:** Increased scrollback history for better command review.
- **Facebook PathPicker Integration:** Launch PathPicker directly from tmux for advanced path selection.
- **Copy Mode Enhancements:** Vim-like copy mode with rectangle selection and direct clipboard copying.
- **Cross-Platform Compatibility:** Works out-of-the-box on Linux, macOS, and Windows terminals.
- **Safe Configuration Reload:** Reload tmux configuration without restarting sessions.
- **Custom Local Overrides:** Easily override settings in `.tmux.conf.local` without modifying the main config.

# Shortcuts

| Key Combination         | Action Description                                      |
|------------------------|--------------------------------------------------------|
| `Ctrl + a`             | My prefix key (GNU Screen compatible)                  |
| `Ctrl + b`             | Default tmux prefix key                                |
| `Ctrl + a, e`          | Edit `.tmux.conf.local` in new window                  |
| `Ctrl + a, r`          | Reload configuration                                   |
| `Ctrl + l`             | Clear screen and history                               |
| `Ctrl + a, c`          | Create new session                                     |
| `Ctrl + a, f`          | Find session (prompt)                                  |
| `Ctrl + a, Shift+Tab`  | Switch to last session                                 |
| `Alt + Up`             | Switch to previous session                             |
| `Alt + Down`           | Switch to next session                                 |
| `Ctrl + a, v`          | Split window horizontally                              |
| `Ctrl + a, h`          | Split window vertically                                |
| `Shift + Arrow Keys`   | Pane navigation (context-sensitive for nano)           |
| `Ctrl + a, >`          | Swap current pane with next pane                       |
| `Ctrl + a, <`          | Swap current pane with previous pane                   |
| `Ctrl + Alt + z`       | Zoom in/out current pane                               |
| `Ctrl + a, +`          | Maximize current pane                                  |
| `Ctrl + a, H`          | Resize pane left by 2                                  |
| `Ctrl + a, J`          | Resize pane down by 2                                  |
| `Ctrl + a, K`          | Resize pane up by 2                                    |
| `Ctrl + a, L`          | Resize pane right by 2                                 |
| `Alt + Right`          | Go to next window                                      |
| `Alt + Left`           | Go to previous window                                  |
| `Ctrl + Shift + H`     | Swap window with previous one and select it            |
| `Ctrl + Shift + L`     | Swap window with next one and select it                |
| `Ctrl + a, Tab`        | Move to last active window                             |
| `Ctrl + a, m`          | Toggle mouse mode                                      |
| `Ctrl + a, F`          | Facebook PathPicker integration                        |
| `Ctrl + a, q`          | Enter copy mode                                        |
| `v` (copy-mode-vi)     | Begin selection in copy mode                           |
| `Ctrl + v` (copy-mode-vi) | Rectangle toggle in copy mode                      |
| `y` (copy-mode-vi)     | Copy selection and cancel                              |
| `Escape` (copy-mode-vi)| Cancel copy mode                                       |
| `H` (copy-mode-vi)     | Start of line in copy mode                             |
| `L` (copy-mode-vi)     | End of line in copy mode                               |
| `Ctrl + a, y`          | Copy to clipboard (OS-specific)                        |
| `Ctrl + a, b`          | List paste buffers                                     |
| `Ctrl + a, p`          | Paste from top paste buffer                            |
| `Ctrl + a, P`          | Choose which buffer to paste from                      |



