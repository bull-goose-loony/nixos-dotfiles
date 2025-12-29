{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # autostart hyprland
  programs.zsh.interactiveShellInit = ''
    # Autostart Hyprland on TTY1 only, only if not already in a Wayland session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "''${XDG_VTNR:-}" = "1" ]; then
      exec Hyprland
    fi
  '';

  environment.systemPackages = with pkgs; [
    hyprpaper
    rofi
    wlr-randr
    wl-clipboard
    waybar
    grim
    slurp
  ];
}
