#show startup messagr
$env.config.show_banner = false
#vi mode stuff
$env.config.cursor_shape = { vi_insert: line, vi_normal: block }
$env.PROMPT_INDICATOR_VI_INSERT = ">"
$env.PROMPT_INDICATOR_VI_NORMAL = "<"


#prompt stuff
$env.TRANSIENT_PROMPT_COMMAND = ""
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_COMMAND_RIGHT = "" 

#init zoxide
zoxide init nushell | save -f ~/.zoxide.nu

#fzf colors
$env.FZF_DEFAULT_OPTS = "
#--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8
#--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
#--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
#--color=selected-bg:#45475A
--ansi"

$env.config.history = {
  max_size: 5000 
  sync_on_enter: true
}
$env.config.edit_mode = 'vi'




