#!/bin/bash

./constants.sh

SUCCESS=()
FAILURES=()

PYTHON_VERSION=3.12.0

print_msg() {
	local color=$1
	local message=$2
	echo -e "${color}${message}${NC}"
}

update_upgrade() {
	sudo apt update -y
	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to update"
		exit 1
	fi

	sudo apt upgrade -y
	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to upgrade"
		exit 1
	fi
}

gitvc() {
	user="henrytang05"
	email="tq.quanghuy@gmail.com"

	sudo apt install git -y
	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to install Git"
		exit 1
	fi

	print_msg $YELLOW "Configuring Git..."
	git config --global user.name $user
	git config --global user.email $email
}
neovim() {
	sudo snap install nvim --classic
	if [[ $? -ne 0 ]]; then
		return 1
	fi

	cd ~/.config
	git clone git@github.com:henrytang05/nvim.git
	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to download Nvim configuration"
		return 1
	fi
	cd ~
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

python() {
	cd ~
	sudo apt-get install build-essential gdb lcov pkg-config \
		libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
		libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
		lzma lzma-dev tk-dev uuid-dev zlib1g-dev -y
	wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
	tar -xf Python-${PYTHON_VERSION}.tgz
	print_msg $CYAN "Clone Python..."
	if [[ $? -ne 0 ]]; then
		return 1
	fi
	cd Python-${PYTHON_VERSION}.*/
	./configure --enable-optimizations
	make

	print_msg $YELLOW "Installing Python..."
	sudo make install
	if [[ $? -ne 0 ]]; then
		return 1
	fi
	cd ~
	rm -rf Python-${PYTHON_VERSION}.tgz Python-${PYTHON_VERSION}*/
}
nerdfont() {
	cd ~
	git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
	cd nerd-fonts
	./install.sh
	if [[ $? -ne 0 ]]; then
		return 1
	fi
	cd ~
}
ruby() {
	print_msg $CYAN "Installing Ruby..."
	sudo apt install ruby-full gem -y
	if [[ $? -ne 0 ]]; then
		echo -e "${RED}Failed to install Ruby${NC}"
		return 1
	fi
}

lazygit() {
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
}

tools() {
	local Tools=(
		bat
		fzf
		neofetch
		curl
		wget
		btop
		lolcat
		arciiquarium
		fd
		ripgrep
	)

	for tool in "${Tools[@]}"; do
		print_msg $CYAN "Installing $tool..."
		sudo apt install $tool -y
		if [[ $? -ne 0 ]]; then
			sudo snap install $tool
		fi
		if [[ $? -ne 0 ]]; then
			FAILURES+=("$tool")
			print_msg $RED "Failed to install $tool"
		else
			SUCCESS+=("$tool")
			print_msg $GREEN "Successfully installed $tool"
		fi
	done
	ruby
	sudo gem install colorls
	if [[ $? -ne 0 ]]; then
		FAILURES+=("colorls")
		print_msg $RED "Failed to install colorls"
	else
		SUCCESS+=("colorls")
		print_msg $GREEN "Successfully installed colorls"
	fi
}
zsh_plugins() {
	cd ~
	print_msg $CYAN "Installing zsh-autosuggestions..."
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	echo -e "${YELLOW}-------${NC}"

	print_msg $CYAN "Installing zsh-syntax-highlighting..."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	echo -e "${YELLOW}-------${NC}"

	print_msg $CYAN "Installing fast-syntax-highlighting..."
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
	echo -e "${YELLOW}-------${NC}"

	print_msg $CYAN "Installing zsh-autocomplete..."
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
	echo -e "${YELLOW}-------${NC}"
}
ohmyzsh() {
	cd ~
	print_msg $CYAN "Installing ZSH..."
	sudo apt install zsh -y
	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to install ZSH"
		return 1
	fi

	print_msg $YELLOW "Configuring ZSH..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

	if [[ $? -ne 0 ]]; then
		print_msg $RED "Failed to download Oh-My-ZSH"
		return 1
	else
		print_msg $GREEN "Successfully download Oh-My-ZSH"
		cp ~/dotfiles/.zshrc ~
	fi
	print_msg $YELLOW "Configuring plugins..."
}
nodejs_snap() {
	sudo snap install node --classic
}
vscode() {
	sudo snap install --classic -y code
}
google-chrome() {
	sudo apt install google-chrome-stable -y
}
tabby() {
	cd ~
	wget https://github.com/Eugeny/tabby/releases/download/v1.0.205/tabby-1.0.205-linux-x64.deb
	sudo dpkg -i tabby-1.0.205-linux-x64.deb
	if [[ $? -ne 0 ]]; then
		return 1
	fi
	rm tabby-1.0.205-linux-x64.deb
}
gh() {
	sudo snap install gh
	gh auth login
}
sublime_text() {
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
}
dotfiles() {
	cd ~
	git clone git@github.com:henrytang05/dotfiles.git
	ln -f ~/dotfiles/.zshrc ~
	ln -f ~/dotfiles/.bashrc ~
}
gcc() {
	sudo apt install gcc -y
}

rust() {
	$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
}
Apps=(
	"update_upgrade"
	"gitvc"
	"gh"
	"tools"
	"neovim"
	"python"
	"nerdfont"
	"ohmyzsh"
	"zsh_plugins"
	"nodejs_snap"
	"vscode"
	"google-chrome"
	"tabby"
	"sublime_text"
	"gcc"
)

DownloadApps() {
	printf "%30s\n" | tr " " "*"
	for app in "${Apps[@]}"; do
		printf "\n"
		print_msg $CYAN "Installing $app..."
		$app
		if [[ $? -ne 0 ]]; then
			print_msg $RED "Failed to install $app"
			FAILURES+=("$app")
		else
			print_msg $GREEN "Successfully installed $app"
			SUCCESS+=("$app")
		fi
		printf "\n"
		printf "%30s\n" | tr " " "*"
	done
}
main() {
	print_msg $CYAN "STARTING SETUP....."
	if [[ ! -d ~/dotfiles ]]; then
		dotfiles
	fi
	DownloadApps

	if [[ ${#FAILURES[@]} -gt 0 ]]; then
		print_msg $RED "Failed to install the following apps:"
		for failed_app in "${FAILURES[@]}"; do
			print_msg $RED "$failed_app"
		done
		exit 1
	else
		print_msg $GREEN "Successfully installed the following apps:"
		for success_app in "${Success[@]}"; do
			print_msg $GREEN "$success_app"
		done
	fi
	print_msg $CYAN "SETUP COMPLETED"
	print_msg $MAGENTA "Remember to check nvim and zsh configuration"
}
main

unset NC="\e[0m"
unset RED="\e[1;31m"
unset GREEN="\e[1;32m"
unset YELLOW="\e[1;33m"
unset BLUE="\e[1;34m"
unset MAGENTA="\e[1;35m"
unset CYAN="\e[1;36m"
unset WHITE="\e[1;37m"
unset BLACK="\e[1;30m"
