DISPLAY=1 SSH_ASKPASS="/Users/khanh/SOFT/aduro/aduro_passphase.sh" ssh-add ~/.ssh/id_aduro < /dev/null
eval "$(ssh-agent -s)"

# My alias
alias copy_aduro_pass="echo 'NewUser1!' | tr -d '\n' | pbcopy"
alias common="emacs $HOME/Dropbox/work/common.org"
alias daily="$HOME/Dropbox/Work/daily/mk-today.sh"
alias emacs-gnu-testing="~/.emacs.d.gnu/gnu-emacs ~/.emacs.d.gnu/config.org"
alias emacs-gnu-config="emacsclient -n -c ~/.emacs.d.gnu/config.org"
alias copy_first_commit="git --no-pager log -n 1 --pretty=format:"%h"|pbcopy"
# Path to your oh-my-zsh installation.
export ZSH=/Users/khanh/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-navigation-tools)

export PATH="opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/Developer/flutter/bin"
export PATH="$PATH:$HOME/.npm-global/bin"

autoload znt-history-widget
zle -N znt-history-widget
bindkey "^R" znt-history-widget

export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
alias python='python3'

