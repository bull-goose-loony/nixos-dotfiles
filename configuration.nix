{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./homerow-mods.nix
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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # touchpad support
  services.libinput.enable = true;

  # fingerprint sensor support
  services.fprintd.enable = true;

  programs.zsh.enable = true;

  # autostart hyprland
  programs.zsh.interactiveShellInit = ''
    # Autostart Hyprland on TTY1 only, only if not already in a Wayland session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "''${XDG_VTNR:-}" = "1" ]; then
      exec Hyprland
    fi
  '';

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
