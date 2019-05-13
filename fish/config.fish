set fish_greeting ""
setenv EDITOR vim

set -gx PATH /usr/local/bin (ruby -e 'print Gem.user_dir')/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/bin $PATH

# Enable for hi-dpi support
setenv GDK_SCALE 2
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
set -gx QT_QPA_PLATFORMTHEME qt5ct

set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

function key_bindings
    fish_vi_key_bindings
    # Use `tn` to exit insert mode.
    bind -M insert -m default tn force-repaint
    bind -M default r backward-char
    bind -M default t forward-char
    bind -M default f up-line
    bind -M default s down-line
    bind -M default l forward-jump
end

set -g fish_key_bindings key_bindings

set -g color_dir_str white
set -g color_vi_mode_indicator white

function su
    /bin/su --shell=/usr/bin/fish $argv
end

set -gx SSH_ENV $HOME/.ssh_environment

function start_agent
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        source $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end
