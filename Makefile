all:
	make install
	make config
	make localbin
	make zsh
	make spacemacs
	make fzf
	make newsboat
	make ssh

install:
	sudo pacman -Syu --no-confirm bat chromium ctags diff-so-fancy dropbox fd firefox git htop irssi jre9-openjdk macchanger mpv mupdf newsboat node npm nvim pandoc pass php stow ttf-hack tldr virtualbox yaourt yarn

config:
	cd ~/dotfiles
	stow config

localbin:
	cp -r ~/dotfiles/localbin ~/localbin

zsh:
	cd ~ && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cd ~/.oh-my-zsh/custom/themes
	wget -O spaceship.zsh-theme https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh
	chsh -s $(which zsh)

spacemacs:
	cd ~ && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cd ~/dotfiles
	stow emacs.d

fzf:
	cd ~ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

newsboat:
	cd ~/dotfiles
	stow newsboat

ssh:
	cd ~/dotfiles
	stow ssh 
