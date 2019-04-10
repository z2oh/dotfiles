# As root user:

# Enable wheel group with visudo.
# This is done by uncommenting the line with `%wheel ALL=(ALL) ALL)`.

# Make non-root user.
useradd -m jaday
passwd jaday

# Add user to wheel group, to grant sudo privileges.
gpasswd -a jaday wheel

# At this point, we can switch to the new user we created.

# Uncomment the line:
# `en_US.UTF-8 UTF-8`
# in /etc/locale.gen

# Generate the locale.
sudo locale-gen

# Set the locale.
sudo localectl set-locale LANG=en_US.UTF-8

# Update package repositories.
sudo pacman -Syy

# Update system.
sudo pacman -Syu

# Install critical packages.
sudo pacman -S base base-devel fish ruby rustup ripgrep exa

# Install packages for non-headless installations.

# Install the `yay` AUR helper.
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -r yay

# Install nerd mono fonts, specifically for Fura Code nerd patched font.
yay -S nerd-fonts-complete-mono-glyphs

# Install vim-plug.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Pull latest .vimrc from dotfiles.
curl -fLo ~/.vimrc https://raw.githubusercontent.com/z2oh/dotfiles/master/vim/.vimrc

# Install vim plugins.
vim +PlugInstall +qall

# Switch to fish.
chsh -s /usr/bin/fish jaday

# Install oh my fish.
curl -L https://get.oh-my.fish | fish

# Install agnoster theme.
omf install agnoster
omf theme agnoster

# Pull latest fish .config from dotfiles.
curl -fLo ~/.config/fish/config.fish --create-dirs https://raw.githubusercontent.com/z2oh/dotfiles/master/fish/config.fish

# Install rust toolchains.
rustup toolchain install stable nightly

# Set the default toolchain to stable.
rustup default stable

# Install rls, clippy, and rustfmt.
rustup component add rls rust-analysis rust-src rustfmt clippy

# Set up an alias to use exa instead of ls.
alias ls=exa -s
