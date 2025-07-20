# Move color setting to a separate function that runs only when needed
function set_kitty_colors
    set color_file ~/.cache/ags/user/generated/kitty-colors.conf
    if test -f $color_file
        kitty @ set-colors --all --configured $color_file
    else
        echo "Color scheme file not found: $color_file"
    end
end

if status is-interactive

    # Ensure fisher is installed
    if not functions -q fisher
        echo "Fisher not found, installing..."
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
    end

    # Ensure required plugins are installed
    set required_plugins jorgebucaran/nvm.fish edc/bass kenji-miyake/reload.fish
    for plugin in $required_plugins
        if not fisher list | grep -q $plugin
            echo "Installing missing fisher plugin: $plugin"
            fisher install $plugin
        end
    end

    set fish_greeting

    # Only run starship init if it exists
    type -q starship; and starship init fish | source

    # Only try to read sequences if the file exists
    set -l seq_file ~/.cache/ags/user/generated/terminal/sequences.txt
    if test -f $seq_file
        cat $seq_file
    end
end

set -gx PATH $HOME/.npm-global/bin $PATH
# set -g __sdkman_custom_dir $HOME/.sdkman
set -gx ANDROID_HOME /home/juan/Android/Sdk
set -gx SDKMAN_DIR $HOME/.sdkman
set -gx JAVA_HOME $SDKMAN_DIR/candidates/java/current

# Your aliases here
alias pamcan=pacman
alias settings="gjs ~/.config/ags/assets/settings.js"
alias bar="nvim ~/.config/ags/modules/bar/main.js"
alias barmodes="nvim ~/.config/ags/modules/bar/modes"
alias config="nvim ~/.ags/config.json"
alias default="micro ~/.config/ags/modules/.configuration/user_options.default.json"
alias colors="kitty @ set-colors -a -c ~/.cache/ags/user/generated/kitty-colors.conf"
alias cfg="git --git-dir=$HOME/.myConfig/ --work-tree=$HOME"
alias vpn="sudo openvpn --config $HOME/Documents/Nas/Novatec/juan.bernal-config.ovpn"

# AutoStarts
keychain --quiet ~/.ssh/github_rsa
source ~/.keychain/(hostname)-fish
zoxide init fish | source
