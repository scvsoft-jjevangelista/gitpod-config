# Personal aliases. Names kept from the old Gitpod bash_aliases set.
#
# Do not redeclare Oh-My-Zsh git aliases (g, ga, gst, gp, gco, ...).
# Do not redeclare image aliases (cdq, gdc).
# Do not redeclare Oh-My-Zsh directory aliases (la, ll, l, lsa).

# pnpm (not provided by the image or Oh-My-Zsh).
alias ppt='pnpm test:php'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pi='pnpm install'
alias pr='pnpm remove'
alias pui='pnpm upgrade-interactive'

# git merge main. Oh-My-Zsh has gm='git merge' and
# gmom='git merge origin/$(git_main_branch)' (origin/main, not local main).
alias gmm='git merge main'

# git up is a local git alias, not an Oh-My-Zsh alias.
# Closest Oh-My-Zsh helper is ggu: git pull --rebase origin <current-branch>.
alias gu='git up'

