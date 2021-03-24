source ~/.bashrc
source ~/.bash_profile_ext.sh

# OPAM configuration
. /Users/jdonaldson/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/openssl/bin:$PATH"

# hush now
export BASH_SILENCE_DEPRECATION_WARNING=1

# added by Miniconda3 4.7.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/jdonaldson/opt/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/jdonaldson/opt/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/Users/jdonaldson/opt/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/jdonaldson/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# update PATH to include personal bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jdonaldson/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jdonaldson/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jdonaldson/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jdonaldson/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion /Users/jdonaldson/opt/miniconda3/bin/python -m pip
# pip bash completion end

