{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./homerow-mods.nix
  ];
  # Keep charge between 75 and 80 percent
  services.tlp.enable = true;
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 75;
    STOP_CHARGE_THRESH_BAT0 = 80;
  };

  # touchpad support
  services.libinput.enable = true;

  # Battery
  services.upower.enable = true;
}
