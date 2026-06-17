{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./homerow-mods.nix
    ../../modules/shared
  ];

  # This hostname can be whatever, doesn't need to match the Nix Flake host
  networking.hostName = "thinkPad";

  # Keep charge between 80 and 90 percent
  services.tlp.enable = true;
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 80;
    STOP_CHARGE_THRESH_BAT0 = 90;
  };

  # touchpad support
  services.libinput.enable = true;

  # Battery
  services.upower.enable = true;
  # host-specific settings here
}
