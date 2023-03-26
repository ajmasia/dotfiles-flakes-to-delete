# history search
hf() {
  local cmd
  cmd="$(HISTTIMEFORMAT='' history | fzf +s --tac --prompt "Select command: " | sed 's/ *[0-9]* *//')"
  if [ -n "$cmd" ]; then
    eval "$cmd"
  fi
}

# cd into a directory
cf () {
  DIR=$(cd "${1:-.}"; fd --type d | fzf --prompt "Go to dir: ")
  [ -n "$DIR" ] && cd "${1:-.}/$DIR"
}

# open a file with NeoVim
vf () {
  cd "${1:-.}"
  FILE=$(fzf -e --preview 'bat --color always {+1}' --prompt "Open with NeoVim: ")
  [ -n "$FILE" ] && nvim "$FILE"
  [ -n $1 ] && cd -
}

# open a file with Lunarvim
lvf () {
  cd "${1:-.}"
  FILE=$(fzf -e --preview 'bat --color always {+1}' --prompt "Open with Lunarvim: ")
  [ -n "$FILE" ] && lvim "$FILE"
  [ -n $1 ] && cd -
}

