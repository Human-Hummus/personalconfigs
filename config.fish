set fish_greeting
set fish_autosuggestion_enabled 0
set XZ_DEFAULTS "-9evv -T 0 "
set EDITOR "nvim"

fastfetch
alias ls="eza --all --icons --color=always"
alias mv="mv -rv"
alias cp="cp -rv"
alias rm="trash-put"
alias txz="tar -vcJf"
alias xzt="tar -vxJf"

starship init fish | source


