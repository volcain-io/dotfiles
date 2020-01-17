# expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST
# don't record an entry that was just recorded again
setopt HIST_IGNORE_DUPS
# don't record an entry starting with a space
setopt HIST_IGNORE_SPACE
# don't record history (fc -l) command
setopt HIST_NO_STORE
# don't record functions
setopt HIST_NO_FUNCTIONS
# remove superfluous blanks before recording entry
setopt HIST_REDUCE_BLANKS
# exclude certain commands from history
export HISTORY_IGNORE="(bat|cat|cd|exa|exit|ls|pass|pwd) *"
