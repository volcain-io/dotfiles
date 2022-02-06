# Check for upgrade of Spacemacs every 14 days
# No log/history
set -o nolog

LOCALBIN_DIR=$HOME/.dotfiles/.localbin
# 1209600 seconds equals 14 days (14 * 24 * 60 * 60)
epoch_target=13
update_file=${ZSH_CACHE_DIR}/.spacemacs.update
lock_file=${ZSH_CACHE_DIR}/.spacemacs.update.lck

function _current_epoch() {
  zmodload zsh/datetime
  echo $(( EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_last_updated_file() {
  echo "LAST_EPOCH=$(_current_epoch)" >! "${update_file}"
}

function _upgrade_spacemacs() {
  sh "${LOCALBIN_DIR}/upgrade-spacemacs"

  _update_last_updated_file
}

function _check_dependencies() {
  # check write permissions to emacs directory
  [[ -w "${HOME}/.emacs.d/" ]] || return 0

  # check, if Spacemacs is installed
  [[ -e ${HOME}/.spacemacs ]] || return 0

  # check, if git is available
  hash git >/dev/null || return 0
}

() {
  _check_dependencies

  trap "
    ret=\$?
    unset -f _check_dependencies _current_epoch _update_last_updated_file _upgrade_spacemacs 2>/dev/null
    command rm -rf '$lock_file'
    return \$ret
  " EXIT INT QUIT

  # No need to run this script, if an update is already being performed
  if [[ ! -e ${lock_file} ]]; then
    touch "${lock_file}"

    # shellcheck disable=SC1090
    if [ -f "${update_file}" ]; then
      . "${update_file}"

      if [[ -z ${LAST_EPOCH} ]]; then
        _update_last_updated_file
        rm -f "${lock_file}"
        return 0
      fi

      #if (( epoch_diff > epoch_target )); then
      if (( ( $(_current_epoch) - LAST_EPOCH ) < epoch_target )); then
        return
      fi

      echo -n "[Spacemacs] Would you like to update? [Y/n]: "
      read -r line
      if [[ "${line}" == Y* ]] || [[ "${line}" == y* ]] || [ -z "${line}" ]; then
        _upgrade_spacemacs
      fi
    else
      echo "Creating update file..."
      _update_last_updated_file
    fi

    rm -f "${lock_file}"
  else
    echo "Unable to lock process. If you are sure an update is not already running, you can remove ${lock_file}"
  fi
}

unset -f _check_dependencies _current_epoch _update_last_updated_file _upgrade_spacemacs
