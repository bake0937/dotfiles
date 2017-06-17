# postgres
set -g -x PATH PGDATA=/usr/local/var/postgres $PATH

# nodebrew
set -g -x PATH $HOME/.nodebrew/current/bin $PATH

# rbenv
#eval "$(rbenv init -)";
#set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# cd > ls
#function cd
#  builtin cd $argv
#  ls -a
#end
