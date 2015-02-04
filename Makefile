all: clean build

build:
	ln -s ~/.dot/zsh/zshrc ~/.zshrc
	ln -s ~/.dot/zsh/zshenv ~/.zshenv
	ln -s ~/.dot/zsh ~/.zsh
	ln -s ~/.dot/vim/vimrc ~/.vimrc
	ln -s ~/.dot/vim ~/.vim
	ln -s ~/.dot/xinitrc ~/.xinitrc
	ln -s ~/.dot/Xresources ~/.Xresources
	ln -s ~/.dot/gitconfig ~/.gitconfig
	ln -s ~/.dot/bashrc ~/.bashrc
	ln -s ~/.dot/bash_profile ~/.bash_profile
	ln -s ~/.dot/bash_aliases ~/.bash_aliases
	ln -s ~/.dot/gemrc ~/.gemrc
	ln -s ~/.dot/tmux.conf ~/.tmux.conf
	ln -s ~/.dot/hgrc ~/.hgrc
	ln -s ~/.dot/i3 ~/.i3
	ln -s ~/.dot/dunstrc ~/.dunstrc

clean:
	rm ~/.zshrc
	rm ~/.zshenv
	rm ~/.zsh
	rm ~/.vimrc
	rm ~/.vim
	rm ~/.xinitrc
	rm ~/.Xresources
	rm ~/.gitconfig
	rm ~/.bashrc
	rm ~/.bash_profile
	rm ~/.bash_aliases
	rm ~/.gemrc
	rm ~/.tmux.conf
	rm ~/.hgrc
	rm -r ~/.i3
	rm ~/.dunstrc
