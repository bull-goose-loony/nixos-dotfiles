{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./homerow-mods.nix
    ./hyprland-setup.nix
  ];

  # Keep charge between 75 and 80 percent
  services.tlp.enable = true;
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 75;
    STOP_CHARGE_THRESH_BAT0 = 80;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  services.getty.autologinUser = "zach";

  # touchpad support
  services.libinput.enable = true;

  programs.zsh.enable = true;

  services.upower.enable = true;

  #  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
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
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment?
}
