.PHONY: all install config localbin zsh ssh vim spacemacs nvm node fzf newsboat
all:
	make install
	make config
	make yay
	make local
	make localbin
	make zsh
	make vim
	make spacemacs
	make newsboat
	make git

install:
	sudo pacman -S --noconfirm adobe-source-code-pro-fonts bat chromium ctags diff-so-fancy dunst emacs exa fd firefox fzf gimp htop i3-gaps inkscape jq macchanger maim mpv mupdf newsboat nodejs npm pandoc pass powerline-fonts ripgrep rlwrap scribus termite tig thunderbird tldr ttf-hack yarn zsh

config:
	ln -sfn ~/.dotfiles/.ctags ~/.
	ln -sfn ~/.dotfiles/.dir_colors ~/.
	ln -sfn ~/.dotfiles/.tern-config ~/.
	ln -sfn ~/.dotfiles/.Xresources ~/.
	ln -sfn ~/.dotfiles/.xinitrc ~/.
	ln -sfn ~/.dotfiles/config/dunst ~/.config/dunst
	ln -sfn ~/.dotfiles/config/i3 ~/.i3
	ln -sfn ~/.dotfiles/config/polybar/ ~/.config/polybar
	ln -sfn ~/.dotfiles/config/rofi/ ~/.config/rofi
	ln -sfn ~/.dotfiles/config/termite/ ~/.config/termite

yay:
	cd ~ && git clone https://aur.archlinux.org/yay.git
	cd ~/yay && makepkg -si

local:
	ln -sfn ~/.dotfiles/local/share/mime/packages/text-markdown.xml ~/.local/share/mime/packages/text-markdown.xml

localbin:
	ln -sfn ~/.dotfiles/localbin/ ~/.localbin

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	ln -sfn ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	ln -sfn ~/.dotfiles/zsh/.zshenv ~/.zshenv
	ln -sfn ~/.dotfiles/zsh/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh

vim:
	git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

spacemacs:
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
	ln -sfn ~/.dotfiles/emacs.d/private/customizations/ ~/.emacs.d/private/customizations
	ln -sfn ~/.dotfiles/.spacemacs ~/.spacemacs

newsboat:
	ln -sfn ~/.dotfiles/newsboat/ ~/.newsboat

git:
	ln -sfn ~/.dotfiles/.gitconfig ~/.
