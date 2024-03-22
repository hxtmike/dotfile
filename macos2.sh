#!/bin/zsh

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
