# DISPLAY=1 SSH_ASKPASS="/Users/khanh/SOFT/aduro/aduro_passphase.sh" ssh-add ~/.ssh/id_aduro < /dev/null
# eval "$(ssh-agent -s)"
# My alias
# alias copy_aduro_pass="echo 'NewUser1!' | tr -d '\n' | pbcopy"
alias common="emacs $HOME/Dropbox/work/common.org"
alias daily="$HOME/Dropbox/SOFT/bin/daily"
alias vim=nvim

alias copy_first_commit="git --no-pager log -n 1 --pretty=format:"%h"|pbcopy"
# Path to your oh-my-zsh installation.
export ZSH=/Users/khanh/.oh-my-zsh


ZSH_THEME="powerlevel10k/powerlevel10k"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)

export PATH="opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$PATH:/usr/local/Cellar/kafka/3.4.0/bin"

export PATH="$PATH:/Library/TeX/texbin"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
