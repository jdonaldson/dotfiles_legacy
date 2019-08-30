source ~/.bashrc
source ~/.bash_profile_ext.sh

# OPAM configuration
. /Users/jdonaldson/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/openssl/bin:$PATH"

# added by Miniconda3 4.7.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
