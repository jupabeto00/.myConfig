# ========================
# START Z-SHELL (ZI)
# ========================
if [ ! -f $HOME/.zi/bin/zi.zsh ]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"

# ========================
# COMPLETIONS
# ========================
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
zicompinit
fastfetch

# ========================
# PLUGINS
# ========================
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-syntax-highlighting
zi light marlonrichert/zsh-autocomplete

# ========================
# EXTERNAL PLUGINS
# ========================
zi ice wait lucid pick'autopair.zsh'
zi load hlissner/zsh-autopair

zi ice has'zoxide' wait lucid
zi light z-shell/zsh-zoxide

# ========================
# SNIPPETS
# ========================
zi snippet OMZP::git
zi snippet OMZP::command-not-found
zi snippet OMZP::sudo
zi snippet OMZP::extract

# ========================
# PROGRAMS
# ========================
zi ice from'gh-r' as'program'
zi light junegunn/fzf

zi ice as'program' from'gh-r' mv'direnv* -> direnv'
zi light direnv/direnv

zi ice as'program' pick'$ZPFX/sdkman/bin/sdk' id-as'sdkman' run-atpull nocompile \
  atclone'curl -s "https://get.sdkman.io?rcupdate=false" -o scr.sh; SDKMAN_DIR=$ZPFX/sdkman bash scr.sh' \
  atpull'SDKMAN_DIR=$ZPFX/sdkman sdk selfupdate' \
  atinit'export SDKMAN_DIR=$ZPFX/sdkman; source $ZPFX/sdkman/bin/sdkman-init.sh'
zi light z-shell/0

zi ice wait lucid
zi light lukechilds/zsh-nvm

# Carapace completions
zi light rsteube/carapace-bin
source <(carapace _carapace)

# ========================
# THEMES
# ========================
zi ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zi light starship/starship

# ========================
# ALIAS
# ========================
alias ls="lsd"
alias la="lsd -la"
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'
alias vpn='sudo openvpn --config $HOME/Documents/Nas/Novatec/juan.bernal-config.ovpn'
# Git Bare aliases
alias cfg='/usr/bin/git --git-dir=$HOME/.myConfig/ --work-tree=$HOME'
alias cfgUntracked='cfg config --local status.showUntrackedFiles no'
alias cfglf='cfg ls-files'
alias cfgaa='cfg add -u'
alias cfgrm='cfg rm --cached -r'
alias cfgst='cfg status'
alias cfgc='cfg commit -m'
alias cfgp='cfg push origin'
alias cfgl='cfg pull origin'
alias cfgfa='cfg fetch --all'
alias cfgrl='cfg fetch origin && cfg reset --hard origin/$(cfg rev-parse --abbrev-ref HEAD)'

# Keychain para ssh-agent
eval "$(keychain --quiet --eval ~/.ssh/github_rsa)"
# luarocks Start
eval "$(luarocks path --bin)"
# Atuin Start
eval "$(atuin init zsh)"
