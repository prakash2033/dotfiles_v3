# dotfiles_v3
    sudo apt install tmux git mpv -y
    sudo apt install git stow coreutils xdotool sxiv cmus htop newsboat -y
    sudo apt install jq fzf dmenu qpdfview task-spooler -y
    sudo apt install xcb libxcb-util0-dev libxcb-cursor-dev -y
    sudo apt install python3-pip python-is-python3 -y
    sudo apt install w3m surfraw rtv -y
    sudo apt install fortunes fortunes ## for random quotes
    pip3 install ueberzug

    # vim
    sudo apt-get install vim vim-gui-common vim-runtime vim-nox

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
