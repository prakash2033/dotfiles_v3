# apt install
    sudo apt install git vim tmux newsboat task-spooler stow mpv htop wget curl fzf w3m surfraw rtv bash-completion hstr build-essential
# kde apps
    sudo apt install kolourpaint

# copy to system clipboard in wayland
# https://github.com/jasonccox/vim-wayland-clipboard
    sudo apt install wl-clipboard

# Generate ssh key
    sudo apt install openssh-client
    ssh-keygen -b 2048 -t rsa

# clone repos
    mkdir -p ~/Public/gitrepo
    cd ~/Public/gitrepo
    git clone git@github.com:prakash2033/dotfiles_v2.git
    git clone git@github.com:prakash2033/dotfiles_v3.git
    git clone git@github.com:prakash2033/wiki.git
    git clone git@github.com/prakash2033/shownotes.git
    git clone https://github.com/so-fancy/diff-so-fancy.git
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1 ## git prompt

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

# homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install gcc

# konsole profile
    ~/.local/share/konsole

# vim
    sudo apt install  vim-gui-common vim-runtime vim-nox
# vim plug install. Run :PlugInstall inside vim. Install vim-gtk aka gvim in linux
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    mkdir -p ~/.vim/pack/vim-wayland-clipboard/start/
    git clone https://github.com/jasonccox/vim-wayland-clipboard.git ~/.vim/pack/vim-wayland-clipboard/start/vim-wayland-clipboard

# dotnet
    wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
    tar -xzvf openssl-1.1.1c.tar.gz
    cd openssl-1.1.1c
    ./config
    make
    sudo make install (it puts it into /usr/local/lib so it doesn't mess with the rest of your system)

    LD_LIBRARY_PATH="/usr/local/lib" dotnet
    # or
    export LD_LIBRARY_PATH="/usr/local/lib"


    wget https://dot.net/v1/dotnet-install.sh
    chmod +x dotnet-install.sh
    ./dotnet-install.sh --channel 7.0
    ./dotnet-install.sh --channel 5.0

# chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
