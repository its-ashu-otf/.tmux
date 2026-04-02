#!/bin/bash
# Versitile Tmux 
# 💛🩷💙🖤❤️🤍
# A script to install "Versitile Tmux configuration
# A config for tmux that is versatile, highly customizable, and easy to use.
# Made with ❤️ by Ashu 
# ------------------------------------------------------------------------------
{
if [ ${EUID:-$(id -u)} -eq 0 ]; then
  printf '❌ Do not execute this script as root!\n' >&2 && exit 1
fi

if [ -z "$BASH_VERSION" ]; then
  printf '❌ This installation script requires bash\n' >&2 && exit 1
fi

# Function to install tmux across different Linux distributions
install_tmux() {
  if tmux -V >/dev/null 2>&1; then
    return 0
  fi

  printf '📦 tmux is not installed. Attempting cross-distro installation...\n' >&2

  if ! command -v sudo >/dev/null 2>&1; then
    printf '❌ sudo is required to install packages automatically. Please install tmux manually.\n' >&2
    exit 1
  fi

  if command -v apt-get >/dev/null 2>&1; then
    printf '▶️  Detected Debian/Ubuntu base (apt-get)\n' >&2
    sudo apt-get update && sudo apt-get install -y tmux
  elif command -v dnf >/dev/null 2>&1; then
    printf '▶️  Detected Fedora/RHEL base (dnf)\n' >&2
    sudo dnf install -y tmux
  elif command -v pacman >/dev/null 2>&1; then
    printf '▶️  Detected Arch base (pacman)\n' >&2
    sudo pacman -Sy --noconfirm tmux
  elif command -v zypper >/dev/null 2>&1; then
    printf '▶️  Detected openSUSE base (zypper)\n' >&2
    sudo zypper install -y tmux
  elif command -v yum >/dev/null 2>&1; then
    printf '▶️  Detected older RHEL/CentOS base (yum)\n' >&2
    sudo yum install -y tmux
  elif command -v apk >/dev/null 2>&1; then
    printf '▶️  Detected Alpine base (apk)\n' >&2
    sudo apk add tmux
  else
    printf '❌ Could not detect a supported package manager. Please install tmux manually.\n' >&2
    exit 1
  fi

  # Verify installation succeeded
  if ! tmux -V >/dev/null 2>&1; then
    printf '❌ Failed to install tmux automatically. Please install it manually.\n' >&2
    exit 1
  fi
  printf '✅ tmux installed successfully.\n\n' >&2
}

# Run the tmux installation check
install_tmux

is_true() {
  case "$1" in
    true|yes|1)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

if ! is_true "$PERMISSIVE" && [ -n "$TMUX" ]; then
  printf '❌ tmux is currently running, please terminate the server\n' >&2 && exit 1
fi

install() {
  printf '🎢 Installing Versitile Tmux! Buckle up!\n' >&2
  printf '\n' >&2
  now=$(date +'%Y%d%m%S')

  for dir in "${XDG_CONFIG_HOME:-$HOME/.config}/tmux" "$HOME/.tmux"; do
    if [ -d "$dir" ]; then
      printf '⚠️  %s directory exists, making a backup → %s\n' "${dir/#"$HOME"/'~'}" "${dir/#"$HOME"/'~'}.$now" >&2
      if ! is_true "$DRY_RUN"; then
        mv "$dir" "$dir.$now"
      fi
    fi
  done

  for conf in "$HOME/.tmux.conf" \
              "$HOME/.tmux.conf.local" \
              "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
              "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf.local"; do
    if [ -f "$conf" ]; then
      if [ -L "$conf" ]; then
        printf '⚠️  %s symlink exists, removing → 🗑️\n' "${conf/#"$HOME"/'~'}" >&2
        if ! is_true "$DRY_RUN"; then
          rm -f "$conf"
        fi
      else
        printf '⚠️  %s file exists, making a backup -> %s\n' "${conf/#"$HOME"/'~'}" "${conf/#"$HOME"/'~'}.$now" >&2
        if ! is_true "$DRY_RUN"; then
          mv "$conf" "$conf.$now"
        fi
      fi
    fi
  done

  if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}" ]; then
    mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
    VERSITILE_TMUX_CLONE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/versitile-tmux"
    TMUX_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
  else
    VERSITILE_TMUX_CLONE_PATH="$HOME/.tmux"
    TMUX_CONF="$HOME/.tmux.conf"
  fi
  TMUX_CONF_LOCAL="$TMUX_CONF.local"

  if [ -d "$VERSITILE_TMUX_CLONE_PATH" ]; then
    printf '⚠️  %s exists, making a backup\n' "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}" >&2
    printf '%s → %s\n' "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}" "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}.$now" >&2
    if ! is_true "$DRY_RUN"; then
      mv "$VERSITILE_TMUX_CLONE_PATH" "$VERSITILE_TMUX_CLONE_PATH.$now"
    fi
  fi

  printf '\n'
  printf '✅ Using %s\n' "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}" >&2
  printf '✅ Using %s\n' "${TMUX_CONF/#"$HOME"/'~'}" >&2
  printf '✅ Using %s\n' "${TMUX_CONF_LOCAL/#"$HOME"/'~'}" >&2

  printf '\n'
  VERSITILE_TMUX_REPOSITORY=${VERSITILE_TMUX_REPOSITORY:-https://github.com/its-ashu-otf/.tmux.git}
  printf '⬇️  Cloning Versitile Tmux repository...\n' >&2
  if ! is_true "$DRY_RUN"; then
    if ! git clone -q --single-branch "$VERSITILE_TMUX_REPOSITORY" "$VERSITILE_TMUX_CLONE_PATH"; then
      printf '❌ Failed\n' >&2 && exit 1
    fi
  fi

  printf '\n'
  if is_true "$DRY_RUN" || ln -s -f "$VERSITILE_TMUX_CLONE_PATH/.tmux.conf" "$TMUX_CONF"; then
    printf '✅ Symlinked %s → %s\n' "${TMUX_CONF/#"$HOME"/'~'}" "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}/.tmux.conf" >&2
  fi
  if is_true "$DRY_RUN" || cp "$VERSITILE_TMUX_CLONE_PATH/.tmux.conf.local" "$TMUX_CONF_LOCAL"; then
    printf '✅ Copied %s → %s\n' "${VERSITILE_TMUX_CLONE_PATH/#"$HOME"/'~'}/.tmux.conf.local" "${TMUX_CONF_LOCAL/#"$HOME"/'~'}" >&2
  fi

  tmux() {
    ${TMUX_PROGRAM:-tmux} ${TMUX_SOCKET:+-S "$TMUX_SOCKET"} "$@"
  }
  if ! is_true "$DRY_RUN" && [ -n "$TMUX" ]; then
    tmux set-environment -g TMUX_CONF "$TMUX_CONF"
    tmux set-environment -g TMUX_CONF_LOCAL "$TMUX_CONF_LOCAL"
    tmux source "$TMUX_CONF"
  fi

  if [ -n "$TMUX" ]; then
    printf '\n' >&2
    printf '⚠️  Installed Versitile Tmux while tmux was running...\n' >&2
    printf '→ Existing sessions have outdated environment variables\n' >&2
    printf '  • TMUX_CONF\n' >&2
    printf '  • TMUX_CONF_LOCAL\n' >&2
    printf '  • TMUX_PROGRAM\n' >&2
    printf '  • TMUX_SOCKET\n' >&2
    printf '→ Some other things may not work 🤷\n' >&2
  fi

  printf '\n' >&2
  printf '🎉 Versitile Tmux successfully installed 🎉\n' >&2
}

if [ -p /dev/stdin ]; then
  printf '✋ STOP\n' >&2
  printf '   🤨 It looks like you are piping commands from the internet to your shell!\n' >&2
  printf "   🙏 Please take the time to review what's going to be executed...\n" >&2

  (
    printf '\n'

    self() {
      printf '# Versitile Tmux\n'
      printf '# 💛🩷💙🖤❤️🤍\n'
      printf '# https://github.com/its-ashu-otf/.tmux\n'
      printf '\n'

      declare -f install
    }

    while :; do
      printf '   Do you want to review the content? [Yes/No/Cancel] > ' >&2
      read -r answer >&2
      case $(printf '%s\n' "$answer" | tr '[:upper:]' '[:lower:]') in
        y|yes)
          case "$(command -v bat)${VISUAL:-${EDITOR}}" in
            *bat*)
              self | LESS='' bat --paging always --file-name install.sh
              ;;
            *vim*)
              self | vim -c ':set syntax=tmux' -R -
              ;;
            *)
              tput smcup
              clear
              self | LESS='-R' ${PAGER:-less}
              tput rmcup
              ;;
          esac
          break
          ;;
        n|no)
          break
          ;;
        c|cancel)
          printf '\n'
          printf '⛔️ Installation aborted...\n' >&2 && exit 1
          ;;
      esac
    done
  ) < /dev/tty || exit 1
  printf '\n'
fi

install
}
