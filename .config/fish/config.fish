if status is-interactive
    zoxide init fish | source
    starship init fish | source
    direnv hook fish | source
    atuin init fish | source

    # dotfiles
    alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    # eza
    alias ls='eza -1 --icons --group-directories-first'
    #alias ll='eza -lbF --git --icons'
    alias ll='eza -lbF --git'
    alias la='eza -lbhHigUmuSa --time-style=long-iso --git --icons'
    alias lt='eza --tree --icons'

    # zellij
    abbr -a zellij-uni 'zellij --layout ~/.config/zellij/layouts/uni.kdl'

    # git
    abbr -a gitc 'git commit -m'
    abbr -a lgit 'lazygit'

end

set -g fish_greeting
