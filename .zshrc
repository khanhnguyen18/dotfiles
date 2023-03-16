# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISPLAY=1 SSH_ASKPASS="/Users/khanh/SOFT/aduro/aduro_passphase.sh" ssh-add ~/.ssh/id_aduro < /dev/null
# eval "$(ssh-agent -s)"
# My alias
alias copy_aduro_pass="echo 'NewUser1!' | tr -d '\n' | pbcopy"
alias common="emacs $HOME/Dropbox/work/common.org"
alias daily="$HOME/Dropbox/Work/daily/mk-today.sh"
alias emacs-gnu-testing="~/.emacs.d.gnu/gnu-emacs ~/.emacs.d.gnu/config.org"
alias emacs-gnu-config="emacsclient -n -c ~/.emacs.d.gnu/config.org"
alias copy_first_commit="git --no-pager log -n 1 --pretty=format:"%h"|pbcopy"
# Path to your oh-my-zsh installation.
export ZSH=/Users/khanh/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting web-search)

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

export PATH="$PATH:/Library/TeX/texbin"
export PATH="/usr/local/opt/node@12/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
