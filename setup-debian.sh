#!/bin/bash

# Versions
fzf_version="0.55.0"   # https://github.com/junegunn/fzf/releases
kanata_version="1.6.1" # https://github.com/jtroo/kanata/releases

# Install required packages
requirements=("ripgrep" "bat" "stow" "curl" "git" "tmux")

sudo apt update
for requirement in "${requirements[@]}"; do
    if ! dpkg -s "$requirement" &>/dev/null; then
        read -p "$requirement is not installed. Install? (y/n) " -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo apt install $requirement
        fi
    fi
done

# Install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    read -p "tpm does not exist. Install? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi

# Install fzf
if ! command -v "fzf"; then
    read -p "fzf does not exist. Install? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        curl -o- -L "https://github.com/junegunn/fzf/releases/download/v$fzf_version/fzf-$fzf_version-linux_amd64.tar.gz" | sudo tar -xz -C /usr/local/bin/
        sudo chmod +x /usr/local/bin/fzf
    fi
fi

# Install kanata
if ! command -v "kanata"; then
    read -p "kanata does not exist. Install? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        curl -o- -L "https://github.com/jtroo/kanata/releases/download/v$kanata_version/kanata" | sudo tar -xz -C /usr/local/bin/
        sudo chmod +x /usr/local/bin/kanata
        # add systemd
    fi
fi

# Use stow to create symlinks
stow -v -t ~/ .
