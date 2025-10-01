#!/usr/bin/env zsh
set -e
echo "export ZDOTDIR=\"\$HOME/.config/zsh\"" >> ~/.zprofile

# Optional: Ensure the scripts directory exists
if [[ ! -d ./scripts ]]; then
  echo "Directory ./scripts does not exist."
  exit 1
fi

# Loop through all files in ./scripts
for file in ./scripts/*; do
  if [[ -f "$file" ]]; then
    echo "Sourcing $file"
    source "$file"
  fi
done


# Exit if stow is not installed
if ! command -v stow &>/dev/null; then
  echo "Error: GNU Stow is not installed."
  echo "Please install it with: brew install stow"
  exit 1
fi

# Move into dotfiles folder
cd dotfiles || { echo "Failed to cd into dotfiles"; exit 1; }
# Add zsh files to .config
echo "Changing to the dotfiles directory"
cd dotfiles || return
stow zsh -t ~
cd .. || return

# Change default .zshrc path
LINE='export ZDOTDIR="$HOME/.config/zsh"'
FILE="$HOME/.zprofile"

if ! grep -qxF "$LINE" "$FILE" 2>/dev/null; then
  echo "$LINE" >> "$FILE"
  echo "Added ZDOTDIR to .zprofile"
else
  echo "ZDOTDIR is already set in .zprofile"
fi

# Finishing message
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
BOLD="\033[1m"
RESET="\033[0m"

echo -e "${GREEN}${BOLD}Done setting up everything!${RESET}"
echo -e "${CYAN}Restart the shell to apply changes.${RESET}"
echo -e "${YELLOW}Time to shine <3${RESET}"
echo -e -n "${BOLD}Press enter to continue...${RESET}"
read
