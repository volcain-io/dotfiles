.PHONY: all install config localbin zsh ssh vim spacemacs nvm node fzf newsboat
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
	# cd ~/ && ln -s .dotfiles/config/ .config
	cd ~/ && ln -sf .dotfiles/.ctags .
	cd ~/ && ln -sf .dotfiles/.dir_colors .
	cd ~/ && ln -sf .dotfiles/.gitconfig .

localbin:
	cd ~ && ln -sf ~/.dotfiles/localbin/ ~/.localbin

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	cd ~ && git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	cd ~ && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	cd ~ && ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	cd ~ && ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh

ssh:
	cd ~ && ln -sf ~/.dotfiles/ssh/ ~/.ssh

vim:
	cd ~ && git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	cd ~ && sh ~/.vim_runtime/install_awesome_vimrc.sh

spacemacs:
	cd ~ && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cd ~ && ln -sf ~/.dotfiles/emacs.d/private/customizations/ ~/.emacs.d/private/customizations
	cd ~ && ln -sf ~/.dotfiles/.spacemacs ~/.spacemacs

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
	cd ~ && ln -sf ~/.dotfiles/newsboat/ ~/.newsboat
