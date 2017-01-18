#!/bin/bash

readonly dotfile_path="${HOME}/.dot"

# source_files and target_files have to be in the same order or
# everything will be wrong. I need to look up a better method
readonly source_files=("${dotfile_path}/zsh/zshrc"
		       "${dotfile_path}/zsh/zshenv"
		       "${dotfile_path}/zsh"
		       "${dotfile_path}/vim/vimrc"
		       "${dotfile_path}/vim"
		       "${dotfile_path}/gitconfig"
		       "${dotfile_path}/bashrc"
		       "${dotfile_path}/bash_profile"
		       "${dotfile_path}/bash_alias"
		       "${dotfile_path}/emacs"
		       "${dotfile_path}/emacs.d"
                       "${dotfile_path}/tmux.cong")

readonly target_files=("${HOME}/.zshrc"
		       "${HOME}/.zshenv"
		       "${HOME}/.zsh"
		       "${HOME}/.vimrc"
		       "${HOME}/.vim"
		       "${HOME}/.gitconfig"
		       "${HOME}/.bashrc"
		       "${HOME}/.bash_profile"
		       "${HOME}/.bash_alias"
		       "${HOME}/.emacs"
		       "${HOME}/.emacs.d"
                       "${HOME}/.tmux.conf")

dependency_check() {
    return 0
}

link_file() {
    local source="$1"
    local target="$2"

    if [[ -f "$target" ]] ; then
	echo "Target file exists. Renaming to ${target}.old"
	mv "$target" "${target}.old"
    fi

    ln -s "$source" "$target"

    return 0
}

link_dotfiles() {
    for ((i=0; i < ${#source_files[@]}; i++))
    do
	link_file ${source_files[i]} ${target_files[i]}
    done
}

main () {
    dependency_check
    link_dotfiles
}

main
