# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


# https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

se(){
	find . | fzf -i | xargs -r $EDITOR
}
_gitLogLineToHash="echo {} |
grep -o '[a-f0-9]\{7\}' |
head -1"

_viewGitLogLine="$_gitLogLineToHash |
xargs -I % sh -c 'git show --color=always % |
diff-so-fancy'"

glog() {  # search for commit with preview and copy hash
  glNoGraph |
      fzf -i -e --no-sort --reverse \
          --tiebreak=index --no-multi \
          --ansi --preview="$_viewGitLogLine" \
          --header "enter: view, C-y: copy hash" \
          --bind "enter:execute:$_viewGitLogLine   |
          less -R" \
          --bind "ctrl-y:execute:$_gitLogLineToHash |
          xsel --clipboard --input"
}

gch() {
  git checkout $(git branch -a | fzf | sed 's/remotes\/origin\///')
}

bind '"\C-O":"se\n"'  # fzf search files

#-------- BASH External Loading {{{
#------------------------------------------------------
# autocompletion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# adds autoomplete to commands that dont work
if [ "$PS1" ]; then
	complete -cf sudo man
fi
#}}}

#-------- Keybinding {{{
#------------------------------------------------------
# movement and autocompeletion at the prompt
bind 'set completion-ignore-case on'	# case insensitive on tab completion
bind '"\t":menu-complete' 		# Tab: Cycle thru completion
bind '"\e[1;3D":backward-kill-word' 	# Alt + arrowleft : delete word backward
bind '"\e\e[D":backward-kill-word' 	# Alt + arrowleft : delete word backward
bind '"\e[1;3A":kill-whole-line' 	# Alt + arrowup : delete whole line
bind '"\e[1;3B":undo'			# Alt + arrowdown : undo
bind '"\e[1;5C":forward-word'		# Ctrl + arrowright : Jump a word forward
bind '"\e[1;5D":backward-word'		# Ctrl + arrowleft : Jump a word backward
bind '"\e[Z":menu-complete-backward'	# Shift+Tab: Cycle backwards
bind '"\e[A": history-search-backward'	# ArrowUp: history completion backwards
bind '"\e[B": history-search-forward'	# ArrowDown: history completion forward

# enable history verification:
# bang commands (!, !!, !?) will print to shell and not be auto executed
# http://superuser.com/a/7416
shopt -s histverify

# Bang! Previous Command Hotkeys
# print previous command but only the first nth arguments
# Alt+1, Alt+2 ...etc
# http://www.softpanorama.org/Scripting/Shellorama/bash_command_history_reuse.shtml#Bang_commands
bind '"\e1": "!:0 \n"'
bind '"\e2": "!:0-1 \n"'
bind '"\e3": "!:0-2 \n"'
bind '"\e4": "!:0-3 \n"'
bind '"\e5": "!:0-4 \n"'
bind '"\e`": "!:0- \n"'     # all but the last word

##


# bind '"\C-O":"fzf-dmenu\n"'

## }}}

# -------- HSTR configuration - add this to ~/.bashrc {{{
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
# }}}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

PATH="/home/prakash/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/prakash/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/prakash/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/prakash/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/prakash/perl5"; export PERL_MM_OPT;
