export PATH=~/bin:/usr/local/sbin:$PATH

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

eval "$(direnv hook bash)"

# export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export PYENV_ROOT=~/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# export WORKON_HOME=~/work/python/envs
# . /usr/local/bin/virtualenvwrapper.sh

alias sa='if [ -r ~/.bash_aliases ]; then . ~/.bash_aliases; fi'
alias sf='if [ -r ~/.bash_functions ]; then . ~/.bash_functions; fi'
alias sr='if [ -r ~/.bashrc ]; then . ~/.bashrc; fi'

sa
sf

# export PS1="\u@\h:\w [\t] <\!>\$ "
export PS1='\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w\[\e[0m\]\n\[\e[1;93m\][\t]\[\e[0m\] <\!>\$ '
