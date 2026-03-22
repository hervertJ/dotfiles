if status is-interactive
    zoxide init fish | source
    starship init fish | source
    direnv hook fish | source

    # dotfiles
    alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    # eza
    alias ls='eza --icons --group-directories-first'
    #alias ll='eza -lbF --git --icons'
    alias ll='eza -lbF --git'
    alias la='eza -lbhHigUmuSa --time-style=long-iso --git --icons'
    alias lt='eza --tree --icons'

    abbr -a zellij-python 'zellij --layout ~/.config/zellij/layouts/python.kdl'
end

set -g fish_greeting
