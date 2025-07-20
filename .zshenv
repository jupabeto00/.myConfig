export NAS="$HOME/Documents/Nas"
export SCRIPTS="$NAS/Personal/scripts"
export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

export ANDROID_HOME="/home/juan/Android/Sdk"

# Telemetry config
# export OTEL_SERVICE_NAME="gemini"
# export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="http://192.168.1.120:4318/v1/traces"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export SDKMAN_DIR="$HOME/.sdkman"

export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:$HOME/.atuin/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools/"
export PATH="$PATH:$ANDROID_HOME/emulator/"
