if status is-interactive
    zoxide init fish | source
    starship init fish | source
    direnv hook fish | source
    atuin init fish | source

    # dotfiles
    alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    abbr -a aadots 'sh ~/scripts/git-add-dots.sh'

    # eza
    alias ls='eza -1 --icons --group-directories-first'
    alias ll='eza -lbF --git --icons'
    alias ll='eza -lbF --git'
    alias la='eza -lbhHigUmuSa --time-style=long-iso --git --icons'
    alias lt='eza --tree --icons'


    # zellij
    abbr -a zellij-uni 'zellij --layout ~/.config/zellij/layouts/uni.kdl'

    # git
    abbr -a gitc 'git commit -m'
    abbr -a lgit 'lazygit'

    # UNI
    abbr -a drivel4 'zen-browser https://bit.ly/Drive_L4'
    abbr -a drivecct 'zen-browser https://bit.ly/DriveFIEE-CCT'
    #https://drive.google.com/drive/u/1/folders/1MOouTdjsP8Fd89cGfOUy_TGZQeSlwQUk

    #zoomer (zoom in any screen)

end

set -g fish_greeting
