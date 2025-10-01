#!/usr/bin/env zsh

# Install zap
if ! command -v zap >/dev/null 2>&1; then
    echo "Zap not installed. Installing Zap"
    /bin/zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k

else
    echo "Zap is already installed"
fi
