{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./niri-setup.nix
    ./laptop.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.timeout = 300;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev"; # REQUIRED for UEFI
    useOSProber = true; # Detect Linux Mint
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  # Network
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  services.getty.autologinUser = "zach";

  programs.zsh.enable = true;

  virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
  };

  #  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "docker"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    vim
    wget
    git
    pulseaudio
    parted
    efibootmgr
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment?
}
