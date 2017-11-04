all:
	make install
	make config
	make localbin
	make zsh
	make spacevim 
	make fzf
	make newsboat
	make plowshare
	make ssh

install:
	sudo pacman -Syu --no-confirm chromium ctags dropbox firefox git irssi mpv mupdf newsboat node nvim plowshare stow ttf-hack virtualbox yaourt yarn

localbin:
	cp -r ~/dotfiles/localbin ~/localbin

zsh:
	cd ~ && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cd ~/.oh-my-zsh/custom/themes
	wget -O spaceship.zsh-theme https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh
	chsh -s $(which zsh)

spacevim:
	cd ~ && curl -sLf https://spacevim.org/install.sh | bash
	cd ~/dotfiles
	stow spacevim

fzf:
	cd ~ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

config:
	cd ~/dotfiles
	stow config

newsboat:
	cd ~/dotfiles
	stow newsboat

plowshare:
	cd ~/dotfiles
	stow plowshare

ssh:
	cd ~/dotfiles
	stow ssh 
