#zoxide
source ~/.config/nushell/imports/.zoxide.nu

#catppuccin
source ~/.config/nushell/imports/catppuccin_mocha.nu

## ${UserConfigDir}/nushell/env.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
source $"($nu.cache-dir)/carapace.nu"

#starship 
# mkdir ($nu.data-dir | path join "vendor/autoload")
# starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# source ~/.local/share/atuin/init.nu

#alias
alias la = ls -a
alias s = yay -Ss
alias i = yay -S
alias r = yay -Rns 
alias ll = ls -l -a
alias l = ls
alias v = nvim
alias c = clear
alias cat = bat
alias cd = z
alias cdi = zi
alias tt = typioca
alias pwd-builtin = pwd
def pwd [] { pwd-builtin | lines }
alias oil = nvim -c "lua require(\"oil\").open()"
alias open-builtin = open
def open [...rest] { open-builtin ...$rest | lines }


def --env cx [arg] {
    cd $arg
    ls 
}

