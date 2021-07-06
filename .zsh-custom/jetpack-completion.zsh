###-begin-jetpack-completions-###
#
# yargs command completion script
#
# Installation: tools/cli/bin/jetpack completion >> ~/.zshrc
#    or tools/cli/bin/jetpack completion >> ~/.zsh_profile on OSX.
#
_jetpack_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" tools/cli/bin/jetpack --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _jetpack_yargs_completions jetpack
###-end-jetpack-completions-###

