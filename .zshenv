export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES="C"
export EDITOR=vi
export BROWSER=chromium
export TERM=st
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export CHROME_PATH=/usr/bin/chromium
# Configure GO
export GOPATH="$HOME/Workspace/go"
export PATH=$GOPATH/bin:$HOME/.local/bin:$HOME/.localbin:$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin:$HOME/.dotnet/tools:/usr/local/bin:/usr/local/sbin:/bin
# fzf default command
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs --vimgrep --glob '!git/*'"
# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
# Configre nnn
export NNN_BMS="D:~/.dotfiles/;d:~/Downloads/;x:~/Dropbox/;p:~/Pictures/;w:~/Workspace/"
export NNN_PLUG="d:diffs;D:dragdrop;g:gutenread;h:hexview;i:imgview;w:ipinfo;r:renamer;s:suedit;t:treeview;u:uidgid;z:z"
# Configure nvm
export NVM_DIR="$HOME/.nvm"
# Configure RUST-RACER
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# Disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
