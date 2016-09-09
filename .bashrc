export PATH=~/bin:/usr/local/sbin:$PATH

eval "$(direnv hook bash)"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# export WORKON_HOME=~/work/python/envs
# . /usr/local/bin/virtualenvwrapper.sh

alias sa='if [ -r ~/.bash_aliases ]; then . ~/.bash_aliases; fi'
alias sf='if [ -r ~/.bash_functions ]; then . ~/.bash_functions; fi'
alias sr='if [ -r ~/.bashrc ]; then . ~/.bashrc; fi'

sf

export PS1="\u@\h:\w [\t] <\!>\$ "

