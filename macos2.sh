#!/bin/zsh

# important note!
echo "This script haven't been fully tested. Wanna continue? (y/n) " 
read answer
if [ "$answer" != "y" ]; then
  exit 0
fi

# if apple silicon
if [[ $(uname -p) == "arm" ]]; then
    softwareupdate --install-rosetta
fi

# check and install homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
    # this is for dependency reason of Homebrew
    sudo mkdir -p /usr/local/include
    sudo mkdir -p /usr/local/lib

    brew update


# check and install zsh-autosuggestion
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# check and install zsh-autosuggestion
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# check and isntall direnv
if ! command -v direnv &> /dev/null; then
    brew install direnv

    mkdir -p ~/.config/direnv
    touch ~/.config/direnv/direnv.toml

    echo "[global]" >> ~/.config/direnv/direnv.toml
    echo "load_dotenv = true" >> ~/.config/direnv/direnv.toml
fi

# check and install pyenv
if ! command -v pyenv &> /dev/null; then
    brew install pyenv
    brew install pyenv-virtualenv
fi


# script above this haven't been tested
# script above this haven't been tested
# script above this haven't been tested
# script above this haven't been tested
# script above this haven't been tested
mkdir -p "$HOME/Library/Application Support/Code/User/"

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

typeset -A dirs_to_repos
dirs_to_repos=(
    ["$HOME/.zsh"]=".zsh"
    ["$HOME/.zshrc"]=".zshrc"
    ["$HOME/.zprofile"]=".zprofile"
    ["$HOME/.vimrc"]=".vimrc"
    ["$HOME/Library/Application Support/Code/User/settings.json"]="./vscode/settings.json"
    ["$HOME/Library/Application Support/Code/User/keybindings.json"]="./vscode/keybindings.json"
)

for dir repo in ${(kv)dirs_to_repos}; do
	# echo ${BASEDIR} $repo $dir
    if  [ -f "$dir" ] || [ -L "$dir" ];then
        rm -rf "$dir"
    fi
    ln -s "${BASEDIR}"/"$repo" "$dir"
done
