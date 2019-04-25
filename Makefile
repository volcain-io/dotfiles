.PHONY: all install config localbin zsh ssh vim spacemacs nvm node fzf newsboat
all:
	make install
	make config
	make localbin
	make zsh
	make vim
	make spacemacs
	make nvm
	make node
	make fzf
	make newsboat

install:
	sudo pacman -S --noconfirm adobe-source-code-pro-fonts bat chromium ctags diff-so-fancy emacs etcher fd firefox gimp git htop inkscape jq macchanger mpv mupdf newsboat neofetch nodejs npm pandoc pass powerline-fonts rlwrap termite tig the_silver_searcher thunderbird tldr ttf-hack ttf-nanum yarn yay zsh

config:
	cd ~ && ln -sf ~/.dotfiles/.ctags .
	cd ~ && ln -sf ~/.dotfiles/.dir_colors .
	cd ~ && ln -sf ~/.dotfiles/.gitconfig .
	cd ~ && ln -sf ~/.dotfiles/.tern-config .
	cd ~ && ln -sf ~/.dotfiles/.Xresources .
	cd ~ && ln -sf ~/.dotfiles/.xinitrc .
	cd ~ && ln -sf ~/.dotfiles/config/i3 ~/.i3
	cd ~ && ln -sf ~/.dotfiles/config/termite/ ~/.config/termite
	cd ~ && ln -sf ~/.dotfiles/config/neofetch/ ~/.config/neofetch

localbin:
	cd ~ && ln -sf ~/.dotfiles/localbin/ ~/.localbin

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	cd ~ && git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	cd ~ && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	cd ~ && ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	cd ~ && ln -sf ~/.dotfiles/zsh/.zshenv ~/.zshenv
	cd ~ && ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh

vim:
	cd ~ && git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	cd ~ && sh ~/.vim_runtime/install_awesome_vimrc.sh

spacemacs:
	cd ~ && git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cd ~ && ln -sf ~/.dotfiles/emacs.d/private/customizations/ ~/.emacs.d/private/customizations
	cd ~ && ln -sf ~/.dotfiles/.spacemacs ~/.spacemacs

nvm:
	cd ~ && curl https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
	cd ~ && source ~/.nvm/nvm.sh

node:
	/usr/bin/nvm install node
	/usr/bin/nvm use node

fzf:
	cd ~ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

newsboat:
	cd ~ && ln -sf ~/.dotfiles/newsboat/ ~/.newsboat
