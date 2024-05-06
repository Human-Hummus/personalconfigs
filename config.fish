set fish_greeting
set fish_autosuggestion_enabled 0
set XZ_DEFAULTS "-9evv -T 0 "
set EDITOR "nvim"

alias ls="eza --all --icons --color=always"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="trash-put"
alias txz="tar -cJf"
alias xzt="tar -xJf"

starship init fish | source


