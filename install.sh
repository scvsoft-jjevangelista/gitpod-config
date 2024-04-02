export PS1="\[\033[01;32m\]\t \[\033[01;36m\]\w \[\033[01;34m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \[\033[01;34m\]% \[\033[0m\]"
git config --global submodule.recurse true
