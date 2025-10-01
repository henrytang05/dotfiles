#!/usr/bin/env zsh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
NC="\033[0m" # No Color

# Detect OS
OS="$(uname)"
IS_MACOS=false
if [[ "$OS" == "Darwin" ]]; then
    IS_MACOS=true
fi

# Install brew if missing
if ! command -v brew &>/dev/null; then
    if $IS_MACOS; then
        echo -s "${BLUE}Homebrew not installed. Installing Homebrew for macOS...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        if [ -x "/opt/homebrew/bin/brew" ]; then
            # For Apple Silicon Macs
            export PATH="/opt/homebrew/bin:$PATH"
        fi
    else
        echo -s "${BLUE}Homebrew not installed. Installing Homebrew for Linux...${NC}"
        cd ~
        git clone https://github.com/Homebrew/brew homebrew
        eval "$(homebrew/bin/brew shellenv)"
        brew update --force --quiet
        chmod -R go-w "$(brew --prefix)/share/zsh"

        # Add Homebrew environment to .zprofile if not already present
        if ! grep -Fxq 'eval "$(homebrew/bin/brew shellenv)"' ~/.zprofile; then
            echo -s 'eval "$(homebrew/bin/brew shellenv)"' >> ~/.zprofile
        fi
    fi
else
    echo -s "${GREEN}Homebrew is already installed.${NC}"
fi



# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
    echo -s "${RED}Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually.${NC}"
    exit 1
fi



echo -s "${BLUE}Updating and upgrading Homebrew...${NC}"
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Install packages
packages=(
    "bat"
    "btop"
    "cava"
    "clipboard"
    "eza"
    "fd"
    "fzf"
    "git"
    "go"
    "lazydocker"
    "lazygit"
    "neovim"
    "node"
    "python"
    "ripgrep"
    "starship"
    "stow"
    "sesh"
    "tlrc"
    "tmux"
    "trash"
    "uv"
    "yazi"
    "zoxide"
)


for package in "${packages[@]}"; do
    if brew list --formula | grep -q "^$package\$"; then
        echo -s "${YELLOW}$package is already installed. Skipping...${NC}"
    else
        echo -s "${BLUE}Installing $package...${NC}"
        brew install "$package"
    fi
done

BREW_ZSH="$(brew --prefix)/bin/zsh"

# Install Homebrew Zsh if missing
if [ ! -x "$BREW_ZSH" ]; then
    echo -s "${BLUE}Homebrew Zsh not found. Installing zsh via Homebrew...${NC}"
    brew install zsh
else
    echo -s "${GREEN}Homebrew Zsh is already installed.${NC}"
fi


if $IS_MACOS; then
    # Get the path to Homebrew's zsh
    BREW_ZSH="$(brew --prefix)/bin/zsh"
    # Check if Homebrew's zsh is already the default shell
    if [ "$SHELL" != "$BREW_ZSH" ]; then
        echo -s "${BLUE}Changing default shell to Homebrew zsh${NC}"
        # Check if Homebrew's zsh is already in allowed shells
        if ! grep -Fxq "$BREW_ZSH" /etc/shells; then
            echo -s "${BLUE}Adding Homebrew zsh to allowed shells...${NC}"
            echo -s "$BREW_ZSH" | sudo tee -a /etc/shells >/dev/null
        fi
        # Set the Homebrew zsh as default shell
        chsh -s "$BREW_ZSH"
        echo -s "${GREEN}Default shell changed to Homebrew zsh.${NC}"
    else
        echo -s "${YELLOW}Homebrew zsh is already the default shell. Skipping configuration.${NC}"
    fi
fi

# Install casks applications
apps=(
    "blip",
    "dimentium/autoraise/autoraiseapp"
    "docker"
    "ghostty"
    "google-chrome"
    "nikitabobko/tap/aerospace"
    "obsidian"
    "raycast"
    "visual-studio-code"
    "zalo"
    "zoom"
)

# macOS-specific installations
if $IS_MACOS; then
    echo -s "${BLUE}Installing macOS cask applications...${NC}"

    for app in "${apps[@]}"; do
        # If app uses tap/path like user/tap/app, tap first
        if [[ "$app" == */*/* ]]; then
            tap_name="${app%/*/*}/${app#*/}"  # correct tap extraction
            app_name="${app##*/}"
            if ! brew tap | grep -q "^${tap_name}$"; then
                echo -s "${BLUE}Tapping $tap_name...${NC}"
                brew tap "$tap_name"
            fi
            if brew list --cask | grep -q "^$app_name\$"; then
                echo -s "${YELLOW}$app_name is already installed. Skipping...${NC}"
            else
                echo -s "${BLUE}Installing $app_name from $tap_name...${NC}"
                brew install --cask "$app_name"
            fi
        else
            if brew list --cask | grep -q "^$app\$"; then
                echo -s "${YELLOW}$app is already installed. Skipping...${NC}"
            else
                echo -s "${BLUE}Installing $app...${NC}"
                brew install --cask "$app"
            fi
        fi
    done
fi

# for app in "${apps[@]}"; do
#     if brew list --cask | grep -q "^$app\$"; then
#         echo -s "${YELLOW}$app is already installed. Skipping...${NC}"
#     else
#         echo -s "${BLUE}Installing $app...${NC}"
#         brew install --cask "$app"
#     fi
# done

# for app in "${apps[@]}"; do
#     if [[ "$app" == */*/* ]]; then
#         tap_name="${app%/*}"
#         app_name="${app##*/}"
#         if ! brew tap | grep -q "^$tap_name\$"; then
#             echo -s "Tapping $tap_name..."
#             brew tap "$tap_name"
#         fi
#         if brew list --cask | grep -q "^$app_name\$"; then
#             echo -s "$app_name is already installed. Skipping..."
#         else
#             echo -s "Installing $app_name from $tap_name..."
#             brew install --cask "$app_name"
#         fi
#     else
#         if brew list --cask | grep -q "^$app\$"; then
#             echo -s "$app is already installed. Skipping..."
#         else
#             echo -s "Installing $app..."
#             brew install --cask "$app"
#         fi
#     fi
# done
#
# Install fonts
fonts=(
    "font-source-code-pro"
    "font-fira-code-nerd-font"
)

for font in "${fonts[@]}"; do
    # Check if the font is already installed
    if brew list --casks | grep -q "^$font\$"; then
        echo -s "$font is already installed. Skipping..."
    else
        echo -s "Installing $font..."
        brew install --casks "$font"
    fi
done

# Update and clean up again for safe measure
echo -s "${BLUE}Final update and cleanup...${NC}"
brew update
brew upgrade
brew cleanup

echo -s "${GREEN}Homebrew setup and configuration complete!${NC}"
