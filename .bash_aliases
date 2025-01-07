alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gclean='git clean -id'
alias gcm='git checkout main'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias glg='git log --stat'
alias glp=_git_log_prettily
alias gm='git merge'
alias gmm='git merge main'
alias pus='git push'
alias gpd='git push --dry-run'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gsh='git show'
alias gst='git status'
alias gss='git status -s'
alias gsb='git status -sb'
alias gu='git up'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias md='mkdir -p'
alias rd=rmdir
alias which-command=whence
alias y=yarn
alias ya='yarn add'
alias yad='yarn add -D'
alias yi='yarn install'
alias yr='yarn remove'
alias yui='yarn upgrade-interactive'
alias yw='yarn why'

alias cdp='cd /workspace/quizlet-web-php'
alias pda="docker exec -e COMPOSER=php/not-transpiled/composer.json -it `docker ps -q --filter name=services-php-fpm` composer dump-autoload --ignore-platform-reqs"
alias pt="docker exec -e COMPOSER=php/not-transpiled/composer.json -e QZ__ENVIRONMENT=test -it `docker ps -q --filter name=services-php-fpm` composer test "
alias pud="cdq & git ls-files --modified --others --exclude-standard | xargs -I {} cp --parents {} /workspace/quizlet-web & cd -"
alias pc="docker exec -e COMPOSER=php/not-transpiled/composer.json -it `docker ps -q --filter name=services-php-fpm` composer "

PS1='\[\033[01;35m\]$(hostname | awk -F"-" '\''{print $NF}'\'')\[\033[01;32m\]$(__git_ps1)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
