{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/shared
  ];

  # This hostname can be whatever, doesn't need to match the Nix Flake host
  networking.hostName = "desktop";
}
