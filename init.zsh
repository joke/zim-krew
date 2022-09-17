(( ${+commands[krew]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[krew]:-"$(${commands[asdf]} which krew 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_krew
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile
} ${0:h}
