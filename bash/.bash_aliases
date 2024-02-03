# -------- Aliases {{{
alias v='$EDITOR' 
alias vim='$EDITOR' 
alias w3m='w3m -cookie' 
alias h='cd $HOME && la' 
alias dox='cd ~/Documents' 
alias dl='cd ~/Downloads' 
alias px='cd ~/Pictures' 
alias mu='cd ~/Music' 
alias vv='cd ~/Videos' 
alias sc='cd ~/.scripts' 
alias cfg='cd ~/.config'  
alias repo='cd ~/Public/gitrepo' 
alias dot='cd ~/Public/gitrepo/dotfiles' 
alias dotv2='cd ~/Public/gitrepo/dotfiles_v2' 
alias dotv3='cd ~/Public/gitrepo/dotfiles_v3' 
alias notes='cd ~/Public/gitrepo/shownotes' 
alias wiki='cd ~/Public/gitrepo/wiki' 

alias dev='cd $HOME/dev'                                                       
alias tos='cd $HOME/dev/tote-tocc-tos'                                      
alias tosnew='cd $HOME/dev/tote-tocc-tos-new'                                  
alias db2='cd $HOME/dev/tote-tocc-db2service' 
alias label='cd $HOME/dev/tote-tocc-labelservice'                            
alias vin='cd $HOME/dev/tote-tocc-vin-service'                            
alias software='cd $HOME/dev/tote-tocc-softwareservice'                        
alias service='cd $HOME/dev/tote-tocc-services-ui'                          
alias notifi='cd $HOME/dev/tote-tocc-notificationservice' 
alias zos='cd $HOME/dev/tote-tocc-zos-connect' 

alias ytv='youtube-viewer'
alias wikimd="$EDITOR ~/.vimwiki/wikimd/index.md"

# }}} 

# -------- Git{{{
alias ga='git add .'
alias gc='git commit'
alias gD='git branch -D $(git branch | fzf)'
alias gd='git diff --color | diff-so-fancy'
alias gds='git diff --staged --color | diff-so-fancy'
alias gs='git status'
alias gp='git pull'
alias gps='git push'
alias gf='git fetch --all'
# }}}

cfg-newsboat() { $EDITOR ~/.newsboat/config ;}
cfg-newsboat-queue() { $EDITOR ~/.newsboat/queue ;}
cfg-newsboat-urls() { $EDITOR ~/.newsboat/urls ;}
cfg-ranger() { $EDITOR ~/.config/ranger/rc.conf ;}
cfg-ranger-commands() { $EDITOR ~/.config/ranger/commands.py ;}
cfg-tmuxrc() { $EDITOR ~/.tmux.conf ;}
cfg-urlportal() { $EDITOR ~/.scripts/urlportal ;}
cfg-vimrc() { $EDITOR ~/.config/vim ;}
cfg-w3m() { $EDITOR ~/.w3m/config ;}
cfg-w3m-keymap() { $EDITOR ~/.w3m/keymap ;}
cfg-profile() { $EDITOR ~/.profile ;}
cfg-bashrc() { $EDITOR ~/.bashrc ;}
cfg-bash-aliases() { $EDITOR ~/.bash_aliases ;}
