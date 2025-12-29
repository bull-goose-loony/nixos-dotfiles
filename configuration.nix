{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
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

  # Homerow Mods with Kmonad!
  services.kmonad = {
    enable = true;
    keyboards.main = {
      device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
      config = ''
        (defcfg
          input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
          output (uinput-sink "kmonad")
          fallthrough true
        )

        (defalias
          home_a   (tap-hold-next-release 200 a         lmeta)
          home_s   (tap-hold-next-release 250 s         lalt)
          home_d   (tap-hold-next-release 150 d         lshift)
          home_f   (tap-hold-next-release 200 f         lctrl)

          home_sc  (tap-hold-next-release 200 semicolon rmeta)
        )

        (defsrc
          q w e r t y u i o p
          a s d f g h j k l semicolon
          z x c v b n m
        )

        (deflayer base
          q w e r t y u i o p
          @home_a @home_s @home_d @home_f g h j k l @home_sc
          z x c v b n m
        )

      '';
    };
  };

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
