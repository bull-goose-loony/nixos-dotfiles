# nixos-dotfiles/home/shell/programs/default.nix
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./noctalia.nix
  ];
}
