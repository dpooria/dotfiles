# # Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=30000
SAVEHIST=100000
bindkey -v
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit bashcompinit
compinit
bashcompinit
# # End of lines added by compinstall
bindkey '^R' history-incremental-search-backward
export PURE_CMD_MAX_EXEC_TIME=5
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
# Variables to store time of the last command
LAST_COMMAND_TIME=""

# Hook before the prompt is shown
function precmd() {
    # Show time if a command was run
    if [[ -n $LAST_COMMAND_TIME ]]; then
        # if [[ $SECONDS -gt 6 ]]; then
            echo -ne "\n\033[32m$LAST_COMMAND_TIME\033[0m"
        # fi

    fi
}

# Hook right before a command is executed
function preexec() {
    # Save the time of the last command
    LAST_COMMAND_TIME=$(date "+%H:%M:%S")
    # SECONDS=0
}
PURE_PROMPT_SYMBOL='%f❯'

#>>> slow 
# setopt autocd extendedglob notify
# fpath+=($HOME/.zsh/conda-zsh-completion/)
# compinit conda
# << slow
# Edit in command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word
export EDITOR="nvim"
# # aliases file
. $HOME/.zsh/aliases.sh
# eval $(thefuck --alias)
# export LESS_TERMCAP_so=$'\e[01;33m'
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal
#
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANROFFOPT="-c"
export MANPAGER="nvim +Man!"
export PAGER='bat'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# keymaps
# autosuggest
bindkey viins -M '^[d' kill-word
bindkey viins -M '^[b' backward-word
bindkey viins -M '^[f' forward-word
bindkey viins -M '^[u' capitalize-word
bindkey viins -M '^[^[[D' backward-word  # Alt + Left Arrow
bindkey viins -M '^[^[[C' forward-word   # Alt + Right Arrow

bindkey -M viins '^[[Z' reverse-menu-complete
bindkey -M vicmd '^[[Z' reverse-menu-complete
bindkey '^ ' autosuggest-accept
#api keys
source $HOME/.api_keys
export LIBVIRT_DEFAULT_URI='qemu:///system'
export MODULAR_HOME="$HOME/.modular"
export MODULAR_HOME="$HOME/.modular"
export PATH="$HOME/go/bin:$HOME/.modular/pkg/packages.modular.com_mojo/bin:$HOME/.local/bin:/bin:$PATH"
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(zoxide init zsh)"

PATH="/home/podabb/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/podabb/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/podabb/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/podabb/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/podabb/perl5"; export PERL_MM_OPT;
