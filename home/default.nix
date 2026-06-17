# nixos-dotfiles/home/default.nix
{
  imports = [
    ./packages.nix
    ./shell
    ./programs
  ];
}
