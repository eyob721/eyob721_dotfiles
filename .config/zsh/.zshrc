#612698 == Initial ==============================================================={{{

# ------------
fpath=(/usr/share/zsh/functions $fpath)
# ------------

# Command history size
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile

# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'

# Starship prompt theme
eval "$(starship init zsh)"

# }}}

# == VIM Mode =============================================================={{{

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# ZSH Key Mode
bindkey -v              # Vim mode
export KEYTIMEOUT=1     # For error with vi mode and autofill

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins    # Initiate to vim insert mode
    echo -ne "\e[5 q"   # Beam cursor
}
zle -N zle-line-init
echo -ne '\e[5 q' # cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # cursor for each new prompt.

# Edit command line in vim with ctrl-e:
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# }}}

# == Aliases ==============================================================={{{
DEV="$HOME/Files/2_Resources/Dev"
ALXSE="$HOME/Files/0_Projects/Alx/programs/software_engineering"
ALXBE="$HOME/Files/0_Projects/Alx/programs/backend_development"
ALXDS="$HOME/Files/0_Projects/Alx/programs/data_science"
BOOTS="$HOME/Files/0_Projects/Boots"

# System aliases
# alias ls='ls --color=auto -l'
# alias l='ls --color=auto -l'
alias ls='lsd -l'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'
alias yay="yay --aur --color=always"
alias initiate_conda='eval "$(/home/papi721/anaconda3/bin/conda shell.zsh hook)"'

# Alx aliases
alias alxse="cd $ALXSE"
alias alxse_projects="cd $ALXSE/projects"
alias alxse_practice="cd $ALXSE/practice"

alias alxbe="cd $ALXBE && conda activate alxbe 2> /dev/null"
alias alxbe_projects="cd $ALXBE/projects && conda activate alxbe 2> /dev/null"
alias alxbe_practice="cd $ALXBE/practice && conda activate alxbe 2> /dev/null"
# alias alx_kitten_sandbox='kitten ssh alxsandbox@192.168.122.121'

alias alxds="cd $ALXDS"

# CLI aliases
alias gcc_alx='gcc -Wall -Wextra -Werror -pedantic -std=gnu89 -g'
alias val_full='valgrind --show-leak-kinds=all --track-origins=yes -s'
alias betty_ch='betty *.[ch]'
alias ghidra="$DEV/tools/ghidra/ghidra_10.3.3_PUBLIC/ghidraRun"
alias w3c="$DEV/tools/others/W3C-Validator/w3c_validator.py"
alias semijs="semistandard"
alias mysql='mariadb'
# alias live-server="live-server --browser='firefox-developer-edition'"

# Developer aliases
alias dev="cd $DEV/"
alias dev_sandbox='ssh papi721@192.168.122.69'
alias boots="cd $BOOTS"

# Java aliases
alias run_java="$DEV/tools/terminal/run_java.sh"

# Experimental
alias git_commit="$DEV/tools/terminal/git_commit.sh"
alias git_dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME "

# Senbet
alias senbet="cd '/home/eyob721/Files/ኦርቶዶክስ ተዋሕዶ/ሰንበት ትምህርት/'"

# Reload zsh
alias reload_zsh="exec '$SHELL'"

# }}}

# == Completion ============================================================{{{

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# }}}

# == Misc =================================================================={{{

# ibus daemon autostart
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -rxRd

# choose editor
export EDITOR=nvim
export VISUAL=nvim

# Pyenv settings
# if [[ -e $(which pyenv) ]]; then
#     export PYENV_ROOT="$HOME/.pyenv"
#     [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

# pip3 requires $HOME/.local/bin to be in PATH
if [[ -e $(which pip3) ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Add GO BIN directory to PATH, so that go programs are recognized
if [[ -e $(which go) ]]; then
    export PATH="$PATH:$HOME/go/bin/"
fi

# Add ruby to PATH for gem executables
if [[ -e $(which ruby) ]]; then
    export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
fi

# Homebrew
if [[ -e $(which brew) ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Start tmux if no tmux session has started already
if [[ -e $(which tmux) ]]; then
    TMUX_SESSION_NAME="manjaro"

    if [[ -z "$TMUX" ]]; then
        tmux new-session -A -s $TMUX_SESSION_NAME
    fi
fi

# ssh-agent service environemnt variable
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Add ssh keys to ssh-agent
# Array of SSH private key file paths
ssh_keys=(
  "$HOME/.ssh/id_github"
  "$HOME/.ssh/id_alx"
  "$HOME/.ssh/id_github_dev"
)

# Get the list of currently loaded keys' fingerprints
loaded_keys=$(ssh-add -l 2>/dev/null | awk '{print $2}')

for key in "${ssh_keys[@]}"; do
  if [[ -f "$key" ]]; then # Check if the key is present
    key_fp=$(ssh-keygen -lf "$key" | awk '{print $2}') # Get the key's fingerprint using ssh-keygen

    if echo "$loaded_keys" | grep -q "$key_fp"; then
      # echo "Key $key already loaded. Skipping."
    else
      ssh-add "$key"
      # echo "Added key: $key"
    fi
  else
    echo "Key file $key not found. Skipping."
  fi
done

# }}}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/papi721/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/papi721/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/papi721/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/papi721/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Auto-activate conda env when changing directory
# Create a .conda_config file inside the directory you want to activate the env for
# The .conda_config file must contain only the env name.
cd() { builtin cd "$@" && 
if [ -f $PWD/.conda_config ]; then
    export CONDACONFIGDIR=$PWD
    conda activate $(cat .conda_config)
elif [ "$CONDACONFIGDIR" ]; then
    if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
        export CONDACONFIGDIR=""
        conda deactivate
    fi
fi }
