.PHONY: all install config localctl systemctl yay zsh spacevim spacemacs polybar dropbox nnn
all:
	make install
	make config
	make localctl
	make systemctl
	make yay
	make zsh
	make spacevim
	make spacemacs
	make polybar
	make dropbox
	make nnn

install:
	sudo pacman -S --noconfirm --needed acpid adobe-source-code-pro-fonts advcp alsa-utils alsa-plugins alsa-lib atool avahi bat chromium compton cronie ctags cups dbus diff-so-fancy dunst emacs exa fd feh firefox fzf gimp highlight htop i3-gaps i3lock inkscape jq macchanger maim mediainfo mpv mupdf newsboat nodejs npm nnn pandoc pass powerline-fonts renameutils ripgrep rlwrap rofi scribus termite tig thunderbird tmux tldr ttf-hack trash-cli whois yarn xorg-server xorg-apps xorg-drivers xorg-init zsh

config:
	ln -sfn ~/.dotfiles/.config/dunst ~/.config/dunst
	ln -sfn ~/.dotfiles/.config/rofi ~/.config/rofi
	ln -sfn ~/.dotfiles/.config/sxiv ~/.config/sxiv
	ln -sfn ~/.dotfiles/.config/termite ~/.config/termite
	ln -sfn ~/.dotfiles/.ctags ~/.
	ln -sfn ~/.dotfiles/.dir_colors ~/.
	ln -sfn ~/.dotfiles/.gitconfig ~/.
	ln -sfn ~/.dotfiles/.i3 ~/.i3
	ln -sfn ~/.dotfiles/.local/share/mime/packages/text-markdown.xml ~/.local/share/mime/packages/text-markdown.xml
	ln -sfn ~/.dotfiles/.localbin/ ~/.localbin
	ln -sfn ~/.dotfiles/.newsboat/ ~/.newsboat
	ln -sfn ~/.dotfiles/.tern-config ~/.
	ln -sfn ~/.dotfiles/.tmux.conf ~/.
	ln -sfn ~/.dotfiles/.Xresources ~/.
	ln -sfn ~/.dotfiles/.xinitrc ~/.

localectl:
	localectl set-keymap de-latin1-nodeadkeys
	localectl set-x11-keymap de

systemctl:
	sudo systemctl enable acpid
	sudo systemctl enable avahi-daemon
	sudo systemctl enable org.cups.cupsd.service
	sudo systemctl cronie
	sudo systemctl --now systemd-timesyncd.service

yay:
	cd ~ && git clone https://aur.archlinux.org/yay.git
	cd ~/yay && makepkg -si && rm -rf ~/yay

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	ln -sfn ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/common_alias.zsh ~/.oh-my-zsh/custom/common_alias.zsh
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/exercism_completion.zsh ~/.oh-my-zsh/custom/exercism_completion.zsh
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/fzf_completion.zsh ~/.oh-my-zsh/custom/fzf_completion.zsh
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/history_options.zsh ~/.oh-my-zsh/custom/history_options.zsh
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/quitcd.zsh ~/.oh-my-zsh/custom/quitcd.zsh
	ln -sfn ~/.dotfiles/.oh-my-zsh/custom/zmv.zsh ~/.oh-my-zsh/custom/zmv.zsh
	ln -sfn ~/.dotfiles/.zprofile ~/.zprofile
	ln -sfn ~/.dotfiles/.zshenv ~/.zshenv
	ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh

spacevim:
	curl -sLf https://spacevim.org/install.sh | bash
	ln -sfn ~/.dotfiles/.SpaceVim.d/init.toml ~/.SpaceVim.d/init.toml

spacemacs:
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
	ln -sfn ~/.dotfiles/.emacs.d/private/customizations/ ~/.emacs.d/private/customizations
	ln -sfn ~/.dotfiles/.spacemacs ~/.spacemacs

polybar:
	yay -S polybar
	ln -sfn ~/.dotfiles/.config/polybar ~/.config/polybar

dropbox:
	yay -S dropbox dropbox-cli

nnn:
	curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
	ln -sfn ~/.dotfiles/.config/nnn/plugins/z ~/.config/nnn/plugins/z
