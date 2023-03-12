(( ${+commands[krew]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[krew]:-"$(${commands[asdf]} which krew 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_krew
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'krew'. Regenerated completions.
  fi
} ${0:h}
