# dotfiles_v3
    ## clone repo
    mkdir -p ~/Public/gitrepo
    cd ~/Public/gitrepo
    git clone git@github.com:prakash2033/dotfiles_v3.git

    ## symlink all folders (trailing slash */) in dotfiles dir to home dir
    cd ~/Public/gitrepo/dotfiles_v3
    stow -v -t ~ */

    ## if new folder is added then:
    # redo link (-R)
    cd ~/Public/gitrepo/dotfiles_v3
    stow -v -R -t ~ */
    stow -v -R -t ~ tmux

    ## if folder was deleted then:
    # delete (-D flag then -R to relink)
    cd ~/Public/gitrepo/dotfiles_v3
    stow -v -D -t ~ */
    stow -v -R -t ~ */

    sudo apt install tmux git mpv  wget curl -y
    sudo apt install git stow coreutils xdotool sxiv cmus htop newsboat -y
    sudo apt install jq fzf dmenu qpdfview task-spooler -y
    sudo apt install xcb libxcb-util0-dev libxcb-cursor-dev -y
    sudo apt install python3-pip python-is-python3 -y
    sudo apt install w3m surfraw rtv -y
    sudo apt install fortunes fortunes ## for random quotes
    pip3 install ueberzug

    # vim
    sudo apt-get install vim vim-gui-common vim-runtime vim-nox

    # vim plug install. Run :PlugInstall inside vim. Install vim-gtk aka gvim in linux
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
    tar -xzvf openssl-1.1.1c.tar.gz
    cd openssl-1.1.1c
    ./config
    make
    sudo make install (it puts it into /usr/local/lib so it doesn't mess with the rest of your system)

    LD_LIBRARY_PATH="/usr/local/lib" dotnet
    # or
    export LD_LIBRARY_PATH="/usr/local/lib"

    mkdir -p ~/Public/gitrepo 
    cd ~/Public/gitrepo
    git clone https://github.com/prakash2033/dotfiles_v2.git
    git clone https://github.com/so-fancy/diff-so-fancy.git
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/prakash2033/shownotes.git

    ## Google Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
    
    # git prompt
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

    wget https://dot.net/v1/dotnet-install.sh
    chmod +x dotnet-install.sh
    ./dotnet-install.sh --channel 7.0
    
    # copy to system clipboard in wayland
    # https://github.com/jasonccox/vim-wayland-clipboard
    sudo apt install wl-clipboard
    
    mkdir -p ~/.vim/pack/vim-wayland-clipboard/start/
    git clone https://github.com/jasonccox/vim-wayland-clipboard.git ~/.vim/pack/vim-wayland-clipboard/start/vim-wayland-clipboard

