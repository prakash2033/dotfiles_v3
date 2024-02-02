# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Added by Toolbox App
export PATH="$PATH:/home/prakash/.local/share/JetBrains/Toolbox/scripts"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export FZF_DEFAULT_OPTS="--color=dark"
export BROWSER="open"
export EDITOR='vim'
export BROWSERCLI="w3m"
export URLPORTAL=~/.scripts/urlportal
export RTV_BROWSER=$URLPORTAL
export IMAGEVIEWER="feh"
export IMAGECLI="feh"
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export LD_LIBRARY_PATH="/usr/local/lib"
export LESS=$LESS" -S -R"
export TERM="xterm-256color"
export SPOOL="tsp"
export ANDROID_HOME="/Users/PVISHWA1/Library/Android/sdk"

## custom w3m hotkeys
export W3M_HOTKEY_OPTIONS=':O'
export W3M_HOTKEY_LINK_BEGIN='f'
export W3M_HOTKEY_RELOAD='r'

[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH"
[ -d "/usr/sbin" ] && PATH="/usr/sbin:$PATH"
[ -d "$HOME/Public/gitrepo/diff-so-fancy" ] && PATH="$HOME/Public/gitrepo/diff-so-fancy:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.dotnet" ] && PATH="$HOME/.dotnet:$PATH"
[ -d "$HOME/.dotnet/tools" ] && PATH="$HOME/.dotnet/tools:$PATH"
[ -d "$HOME/dev/flutter/bin" ] && PATH="$HOME/dev/flutter/bin:$PATH"
[ -d "$ANDROID_HOME/tools" ] && PATH="$ANDROID_HOME/tools:$PATH"
[ -d "$ANDROID_HOME/tools/bin" ] && PATH="$ANDROID_HOME/tools/bin:$PATH"
[ -d "$ANDROID_HOME/platform-tools" ] && PATH="$ANDROID_HOME/platform-tools:$PATH"

# -------- Add colors to the less and man commands {{{

export LESS=-R
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb=$'\e[1;31mm'    # begin blinking
export LESS_TERMCAP_md=$'\e[1;36m'     # begin bold
export LESS_TERMCAP_us=$'\e[1;332m'    # begin underline
export LESS_TERMCAP_so=$'\e[1;44;33m'  # begin standout-mode - info box
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_ue=$'\e[0m'        # end underline
export LESS_TERMCAP_se=$'\e[0m'        # end standout-mode

# }}}

# -------- Perl for YouTube-Viewer {{{

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# }}}


