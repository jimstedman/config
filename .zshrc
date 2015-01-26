export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jim"
COMPLETION_WAITING_DOTS="true"
export LANG=en_US.UTF-8

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python pylint pyenv pip kate wd)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/lib/aliases.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    #export EDITOR='mvim'
fi
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export TERM="xterm-256color"
setopt RM_STAR_WAIT # sanity check on rm *
setopt CORRECT # spellcheck
setopt noflowcontrol # reclaim ctrl q and ctrl s

# now vim can use !s and !q
alias vim="stty stop '' -ixoff ; vim"
ttyctl -f

# colored completion - use my LS_COLORS
eval $(dircolors ~/.dir_colors/dircolors.256dark)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# command for battery life
alias batterylife="echo $((100*$(sed -n "s/remaining capacity: *\(.*\) m[AW]h/\1/p" /proc/acpi/battery/BAT0/state)/$(sed -n "s/last full capacity: *\(.*\) m[AW]h/\1/p" /proc/acpi/battery/BAT0/info)))%"
