{ config, pkgs, ... }:

{
  imports = [
    ./home/packages.nix
      ./home/shell/zsh.nix
      ./home/shell/starship.nix
      ./home/shell/aliases.nix
      ./home/shell/env.nix
      ./home/programs/git.nix
      ./home/programs/alacritty.nix
  ];

  home.username = "zach";
  home.homeDirectory = "/home/zach";

# This value determines the home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new home Manager release introduces backwards
# incompatible changes.
#
# You can update home Manager without changing this value. See
# the home Manager release notes for a list of state version
# changes in each release.
  home.stateVersion = "26.11";
}
