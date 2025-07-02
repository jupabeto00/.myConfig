# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# Path to your Oh My Zsh installation.

export NAS="$HOME/Documents/Nas"
export SCRIPTS="$NAS/Personal/scripts"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/.atuin/bin"
export BROWSER=""

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

# alias
alias fd='fdfind'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'
alias config='/usr/bin/git --git-dir=$HOME/.myConfig/ --work-tree=$HOME'
alias screen='grim -g "$(slurp)" - | swappy -f -'

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-autocomplete
	sudo
	aws
	command-not-found
  gradle
  sdk
  nvm
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
eval "$(luarocks path --bin)"
eval $(keychain --quiet --eval ~/.ssh/github_rsa)
eval "$(direnv hook zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

