#!/usr/bin/env bash
set -euo pipefail

install_lazygit() {
  if command -v lazygit &>/dev/null; then
    echo "lazygit is already installed: $(lazygit --version)"
    return 0
  fi

  echo "Installing lazygit..."
  if [[ "$(uname)" == "Darwin" ]]; then
    brew install lazygit
  elif [[ -f /etc/debian_version ]]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo install /tmp/lazygit /usr/local/bin
    rm -f /tmp/lazygit /tmp/lazygit.tar.gz
  elif [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm lazygit
  elif [[ -f /etc/fedora-release ]]; then
    sudo dnf install -y lazygit
  else
    echo "Unsupported OS for lazygit installation"
    return 1
  fi
  echo "lazygit installed successfully"
}

install_yazi() {
  if command -v yazi &>/dev/null; then
    echo "yazi is already installed: $(yazi --version)"
    return 0
  fi

  echo "Installing yazi..."
  if [[ "$(uname)" == "Darwin" ]]; then
    brew install yazi
  elif [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm yazi
  elif command -v cargo &>/dev/null; then
    cargo install --locked yazi-fm yazi-cli
  else
    echo "Installing yazi via cargo (installing rustup first)..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    cargo install --locked yazi-fm yazi-cli
  fi
  echo "yazi installed successfully"
}

main() {
  echo "=== Dotfiles Tool Installer ==="
  install_lazygit
  install_yazi
  echo "=== All tools installed ==="
}

main "$@"
