ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

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

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

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

# shorten some stuff
alias v='nvim'
alias ff='fastfetch'
alias tt='typioca'
alias c='clear'
# replace cat with bat
alias cat='bat'
# ls aliases
alias lm='eza --color=always -l --icons --no-user --no-permissions --no-time --no-filesize'
alias ls=' eza -lh --icons  --color=always --group-directories-first '
alias l=' eza -lh --icons=always --color=always  --group-directories-first '
alias tree='eza --color=always -l --icons --no-user --no-permissions --no-time --no-filesize --tree'
alias la='ls -a'
# add some nushell ls stuff
alias nuls='nu -c "ls" '
alias nups='nu -c "ps" '
# yay aliases
alias s='yay -Ss'
alias i='yay -S'
alias r='yay -Rns' 
# fetch
alias mfetch=' mfetch  --os --kernel --shell --uptime --wm --colors'
# waybar themes
alias omwaybar='pkill waybar; waybar -c ~/.config/waybar/themes/omarchy-waybar/config.jsonc -s ~/.config/waybar/themes/omarchy-waybar/style.css & disown'
alias tonybar='pkill waybar; waybar -c ~/.config/waybar/themes/tonybar/config.jsonc -s ~/.config/waybar/themes/tonybar/style.css & disown'
# atuin scripts
alias asr='atuin scripts run'
alias asn='atuin scripts new'
alias asl='atuin scripts list'
alias asd='atuin scripts delete'
# make diff nicer
alias diff="diff -u --color=always"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# alias cd="__zoxide_z"
alias cdi="__zoxide_zi"

export PATH="$HOME/scripts:$PATH"
set -o vi
eval "$(atuin init zsh --disable-up-arrow )"

function cx() {
    cd "$1"
    ls
}
#
stty ixany

source ~/.local/bin/comps/todo-comp.sh

export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_OPTS="--ansi --reverse"
export EDITOR=nvim

eval "$(oh-my-posh init zsh --config $HOME/.config/omp.toml)"

# cd $(fd --type directory -H . /home/divalin | sed 's|^/home/divalin/||' | fzf --color="bw")


