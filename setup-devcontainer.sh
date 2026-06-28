#!/bin/bash

# Install required packages
requirements=("ripgrep" "bat" "stow" "curl" "git" "tmux")

# sudo apt update
sudo apt install $(requirement)

# Install ohmyposh
if [ ! -d "$HOME/.local/bin/oh-my-posh" ]; then
	echo "Installing oh-my-posh..."
	curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Installing tpm..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install zoxide
if ! command -v "zoxide"; then
	echo "Installing zoxide..."
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Install fzf
if ! command -v "fzf"; then
	echo "Installing fzf..."
	fzf_url=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r -c ' .assets | .[] | select( .browser_download_url | contains("linux_amd64")) | .browser_download_url')
	curl -o- -L $fzf_url | sudo tar -xz -C /usr/local/bin/
	sudo chmod +x /usr/local/bin/fzf
fi

# Install lazygit
if ! command -v "lazygit"; then
	echo "Installing lazygit..."
	lazygit_url=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | jq -r -c ' .assets | .[] | select( .browser_download_url | contains("linux_x86_64")) | .browser_download_url')
	curl -o- -L $lazygit_url | sudo tar -xz -C /usr/local/bin/
	sudo chmod +x /usr/local/bin/lazygit
fi

# Install stow
if ! command -v "stow"; then
	echo "Installing stow..."
	curl -o- -L "http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz" | sudo tar -xz -C /tmp
	/tmp/stow-2.4.1/configure && make -C /tmp/stow-2.4.1/ install
fi

# Use stow to create symlinks
stow -v --dotfiles -t ~/ .
