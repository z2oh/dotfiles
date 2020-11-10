# Layout

Directories marked with a ❗ are important, commonly used, or otherwise critical to my system configuration.

#### `bin`

* Some binary scripts intended to be executable via `$PATH`.
* Highly targeted for my computing environment.

#### `chunkwm`

* Configuration scripts for macOS tiling window manager `chunkwm`.
* Deprecated; [`yabai`](https://github.com/koekeishiya/yabai) is my replacement.

#### `fish` ❗

*  Configuration files for [the friendly shell](https://fishshell.com/).
* `fish/functions` contain some aliases for common shell utilities (`ls` and `cat`) mapping them to modern equivalents (`exa` and `bat`, respectively).

#### `konsole`

* Configuration files for the [`konsole`](https://konsole.kde.org/) terminal emulator. Most importantly: a custom implementation of the PaperColor-Light color scheme.
* This will be deprecated as soon as the excellent [`alacritty`](https://github.com/alacritty/alacritty/) emulator gets [support for ligatures](https://github.com/alacritty/alacritty/issues/50).
* `konsole` is only used on my linux environments which are graphically interfaced.

#### `polybar`

* Configuration files for the [`polybar`](https://github.com/polybar/polybar) menubar.
* Heavily coupled with my specific hardware.

#### `qmk` ❗

* Custom firmware for my QMK-based keyboards.
* Most importantly, provides key mappings for software-agnostic Colemak layouts.
* Requires additional software, [see instructions here](https://docs.qmk.fm/#/newbs_flashing).

#### `skhd` ❗

* Configuration for the [`skhd`](https://github.com/koekeishiya/skhd) macOS hotkey daemon. Used to drive my tiling window manager [`yabai`](https://github.com/koekeishiya/yabai).

#### `termite`

* Configuration for the [`termite`](https://github.com/thestinger/termite) terminal emuator.
* Deprecated in favor of [`konsole`](https://konsole.kde.org/), which supports ligatures.

#### `udev`

* Tiny udev rules to automatically switch software keyboard layout back to QWERTY when one of my Colemak based keyboards is plugged in.
* Requires absolute paths, and thus `/home/jaday/bin` is referenced directly.
* The scripts to run are found in this repo's `bin` folder.

#### `vim` ❗

* `.vimrc`: the most important configuration there is.

#### `x`

* Some [`X11`](https://en.wikipedia.org/wiki/X_Window_System) setup scripts.

#### `xmonad`

* Configuration files for the [`xmonad`](https://xmonad.org/) tiling window manager for X.
* Configuration is Haskell, so that's kinda neat.
* Will be deprecated when I get around to actually setting up an [`i3`](https://i3wm.org/) configuration that I like.

#### `yabai` ❗

* Configuration files for the macOS [`yabai`](https://github.com/koekeishiya/yabai) tiling window manager.
