eval "$(starship init zsh)"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#   --highlight-line \
#   --info=inline-right \
#   --ansi \
#   --border=rounded \
#   --margin=3%
#   --layout=reverse \
#   --color=bg+:#2e3c64 \
#   --color=bg:#1E1E2E \
#   --color=border:#89B4FA \
#   --color=fg:#c0caf5 \
#   --color=gutter:#1E1E2E \
#   --color=header:#FAB387 \
#   --color=hl+:#89B4FA \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#89B4FA \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#89B4FA \
#   --color=separator:#FAB387 \
#   --color=spinner:#F08AA7 \
# "
#



export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export GEMINI_CLI_FLAGS='--no-telemetry-no-telemetry-log-prompts'


if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

#zinit snippet OMZL::git.zsh
#zinit snippet OMZP::git
#zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit

zinit cdreplay -q


bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias v='nvim'
alias ff='fastfetch'
alias tt='typioca'
alias c='clear'
alias cat='bat'
alias lm='eza --color=always -l --icons --no-user --no-permissions --no-time --no-filesize'
alias ls=' eza -la --icons --no-time --no-filesize   --group-directories-first '
alias l=' eza -la --icons --no-time --no-filesize   --group-directories-first '
alias tree='eza --color=always -l --icons --no-user --no-permissions --no-time --no-filesize --tree'
alias nuls='nu -c "ls" '
alias nups='nu -c "ps" '
alias la='ls -a'
alias s='yay -Ss'
alias i='yay -S'
alias r='yay -Rns' 
alias mfetch=' mfetch  --os --kernel --shell --uptime --wm --colors'


eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export PATH="$HOME/scripts:$PATH"
set -o vi
# eval "$(atuin init zsh)"

function cx() {
    cd "$1"
    ls
}
#colorscript random
stty ixany
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'q' clear-screen

export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_OPTS="--ansi --reverse --height=10"
