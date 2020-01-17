# expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST
# don't record an entry that was just recorded again
setopt HIST_IGNORE_DUPS
# don't record an entry starting with a space
setopt HIST_IGNORE_SPACE
# remove superfluous blanks before recording entry
setopt HIST_REDUCE_BLANKS
# use EXTENDED_GLOB syntax
setopt extendedglob
# exclude certain commands from history
export HIST_IGNORE="(bat|cat|cd|exa|exit|history|ls|pass|pwd)"
