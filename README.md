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
    
