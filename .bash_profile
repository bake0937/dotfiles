#rbenv
eval "$(rbenv init -)"

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

#Load .bashrc on bash startup
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
. /usr/local/Cellar/git/2.10.2/etc/bash_completion.d/git-completion.bash

#postgres
export PGDATA=/usr/local/var/postgres
