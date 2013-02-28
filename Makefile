all: clean build

build:
	ln -s ~/.config/zshrc ~/.zshrc
	ln -s ~/.config/zsh/zshenv ~/.zshenv
	ln -s ~/.config/zsh ~/.zsh
	ln -s ~/.config/vimrc ~/.vimrc
	ln -s ~/.config/vim ~/.vim
	ln -s ~/.config/xinitrc ~/.xinitrc
	ln -s ~/.config/Xresources ~/.Xresources
	ln -s ~/.config/gitconfig ~/.gitconfig
clean:
	rm ~/.zshrc
	rm ~/.zshenv
	rm ~/.zsh
	rm ~/.vimrc
	rm ~/.vim
	rm ~/.xinitrc
	rm ~/.Xresources
	rm ~/.gitconfig

test:
	rm ~/.zshrc
	rm ~/.zshenv
	ln -s ~/.config/zsh/zshrc ~/.zshrc
	ln -s ~/.config/zsh/zshenv ~/.zshenv
