{ pkgs, ... }: {

  home.packages = with pkgs; [
    zsh
      alacritty
      starship
      neovim
      ghostty
      opencode
      zsh-syntax-highlighting
      vscode
      yazi
      fastfetch
      bat

# Fonts
      font-awesome
      nerd-fonts.jetbrains-mono

# Note, obsidian is an "unfree" package which is why we had to
# explicitly allow them 
      obsidian

# archives
      zip
      xz
      unzip
      p7zip

# utils
      zoxide
      stow
      tmux
      tldr
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza
      fzf
      fd
      man-pages
      man-pages-posix

# nix related
#
# it provides the command `nom` works just like `nix`
# with more details log output
      nix-output-monitor

# productivity
      hugo # static site generator
      glow # markdown previewer in terminal

      btop  # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

# system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

# system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb
      libinput
      upower

# Language Servers

# Lua
      lua-language-server

# Nix
      alejandra
      nil

# Python
      basedpyright
      python312
      python312Packages.pip
      python312Packages.virtualenv

# C/C++
      clang-tools
      clang
      llvm
      lld

# Nix
      nil
      alejandra

# Rust
      rust-analyzer
      rustfmt

# Web / JS / TS
      nodejs
      typescript
      typescript-language-server
      vscode-langservers-extracted
      ];

               }
