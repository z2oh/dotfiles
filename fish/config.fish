# Disable the default fish greeting.
set fish_greeting ""

# Set default editor to vim.
set -x EDITOR vim
set -x VISUAL vim

# The `p` flag means prepend, the `g` flag means global, and the `x` flag means
# export (as environment variable).
set -pgx PATH $HOME/.yarn/bin
set -pgx PATH $HOME
set -pgx PATH $HOME/bin
set -pgx PATH $HOME/.cargo/bin

set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

function key_bindings
    fish_vi_key_bindings
    # Use `tn` to exit insert mode.
    bind -M insert -m default tn force-repaint
    # Home moves to the start of the current line.
    bind -M insert -k home beginning-of-buffer
    bind -M default -k home beginning-of-buffer
    # Remap keys to match custom vim keys.
    bind -M default r backward-char
    bind -M default t forward-char
    bind -M default f up-line
    bind -M default s down-line
    bind -M default l forward-jump
end

function fish_vi_cursor ; end

set -g fish_key_bindings key_bindings

# Set the color of the directory prompt
set -g color_dir_str white
# Set the color of the text in the vi mode prompt.
set -g color_vi_mode_indicator white
