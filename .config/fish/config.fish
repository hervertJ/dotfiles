if status is-interactive
    zoxide init fish | source
    starship init fish | source
    direnv hook fish | source
    
    alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    abbr -a zellij-python 'zellij --layout ~/.config/zellij/layouts/python.kdl'
end
