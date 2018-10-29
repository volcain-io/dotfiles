all:
	make install
	make config
	make localbin
	make zsh
	make ssh
	make vim
	make spacemacs
	make nvm
	make node
	make fzf
	make newsboat

install:
	sudo pacman -S --noconfirm bat chromium ctags diff-so-fancy fd firefox git htop jq macchanger mpv mupdf newsboat neofetch nodejs npm pandoc pass rlwrap rxvt-unicode tig ttf-hack tldr yaourt yarn zsh

config:
	cd ~/ && ln -s .dotfiles/config/ ~/.config
	cd ~/ && ln -s .dotfiles/.ctags ~/.ctags
	cd ~/ && ln -s .dotfiles/.dir_colors ~/.dir_colors
	cd ~/ && ln -s .dotfiles/.gitconfig ~/.gitconfig

localbin:
	cd ~ && ln -s ~/.dotfiles/localbin/ ~/.localbin

zsh:
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh

ssh:
	cd ~ && ln -s ~/.dotfiles/ssh/ ~/.ssh

vim:
	cd ~ && git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	cd ~ && sh ~/.vim_runtime/install_awesome_vimrc.sh

spacemacs:
	cd ~ && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	rm -rf ~/.emacs.d/private
	cd ~ && ln -s ~/.dotfiles/emacs.d/private/ ~/.emacs.d/private/
	cd ~ && ln -s ~/.dotfiles/.spacemacs ~/.spacemacs

nvm:
	cd ~ && curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
	cd ~ && source ~/.nvm/nvm.sh

node:
	nvm install node
	nvm use node

fzf:
	cd ~ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

newsboat:
	cd ~ && ln -s ~/.dotfiles/newsboat/ ~/.newsboat
