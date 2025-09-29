# Set directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Git prompt function
git_prompt_info() {
    local git_branch git_status git_dirty=""

    # Check if we're in a git repository
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Get current branch name
        git_branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

        # Check if working directory is dirty
        if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
            git_dirty="*"
        fi

        # Check for untracked files
        if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
            git_dirty="${git_dirty}+"
        fi

        # Check if we're ahead/behind remote
        local ahead_behind=""
        if git_status=$(git status --porcelain=v1 -b 2>/dev/null); then
            if echo "$git_status" | grep -q "ahead"; then
                ahead_behind="${ahead_behind}↑"
            fi
            if echo "$git_status" | grep -q "behind"; then
                ahead_behind="${ahead_behind}↓"
            fi
        fi

        # Return formatted git info
        echo " %F{red}git: ${git_branch} %F{yellow}${git_dirty}%F{cyan}${ahead_behind}"
    fi
}

# Enhanced prompt with git information
setopt PROMPT_SUBST
if [[ $EUID -eq 0 ]]; then
    export PS1='%F{green}%n[root] %F{yellow}%~%f$(git_prompt_info)%F{green}
$ ' # root user
else
    export PS1='%F{cyan}%n%f %F{yellow}%~%f$(git_prompt_info)%F{green}
$ ' # normal user
fi

# History configuration
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE

# History options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_verify
setopt hist_reduce_blanks

# Enable vim motions
bindkey -v
# Change cursor shape depending on vi mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        # Normal mode → Block cursor
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        # Insert mode → Beam cursor
        echo -ne '\e[5 q'
    fi
}

function zle-line-init {
    # Start in insert mode with beam cursor
    echo -ne '\e[5 q'
}

function zle-line-finish {
    # Reset cursor when leaving zle
    echo -ne '\e[1 q'
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# Enable using j and k in to specific func search
bindkey -M vicmd 'j' history-search-backward
bindkey -M vicmd 'k' history-search-forward

# Completion styling
zstyle :compinstall filename '/home/divolli/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=auto $realpath'

# Shell integrations
eval "$(fzf --zsh)"

#Aliases
alias ls='ls --color=auto'

# Make rm safer
rm() {
    if [[ "$*" == *"-r"* ]]; then
        # If -r is specified, ask for confirmation
        printf "Recursive delete requested for: %s\n" "$*"
        printf "Continue? (y/N): "
        read -r response
        [[ "$response" =~ ^[Yy]$ ]] && command rm "$@"
    else
        # Regular files get -i
        command rm -i "$@"
    fi
}

# Make cp, and mv interactive by default
alias cp='cp -i'
alias mv='mv -i'

# Safer ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Show file sizes in human readable format
alias df='df -h'
alias du='du -h'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
