# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jjd/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jjd/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jjd/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jjd/.fzf/shell/key-bindings.zsh"

