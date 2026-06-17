# nixos-dotfiles/home/shell/default.nix
{
  imports = [
    ./zsh.nix
    ./env.nix
    ./aliases.nix
    ./starship.nix
    ./fastfetch.nix
    ./zoxide.nix
  ];
}
