{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./lang-servers.nix
  ];

  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    libinput
    ghostty
    ripgrep
    zsh
    yazi
    neovim
    upower
    tmux
    stow
    fastfetch
    starship
    zoxide
    fzf
    bat
    eza
    zsh-syntax-highlighting
    tldr
    font-awesome
    nerd-fonts.jetbrains-mono
    obsidian
    vscode
    opencode
  ];

}
