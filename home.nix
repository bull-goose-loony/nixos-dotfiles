{
  config,
  pkgs,
  ...
}: {
  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    libinput
    ghostty
    ripgrep
    zsh
    waybar
    yazi
    hyprpaper
    neovim
    upower
    wlr-randr
    rofi
    tmux
    stow
    fastfetch
    starship
    zoxide
    fzf
    bat
    eza
    zsh-syntax-highlighting
    grim
    slurp
    wl-clipboard
    tldr
    font-awesome
    nerd-fonts.jetbrains-mono

    # Lua
    lua-language-server

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
