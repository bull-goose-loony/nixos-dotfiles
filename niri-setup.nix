{ pkgs, ...}:

{
  programs.niri.enable = true;

  # autostart niri
  programs.zsh.interactiveShellInit = ''
    # Autostart Hyprland on TTY1 only, only if not already in a Wayland session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "''${XDG_VTNR:-}" = "1" ]; then
      exec niri
    fi
  '';

  environment.systemPackages = with pkgs; [
    # File explorer
    thunar
    thunar-volman

    # Default terminal for niri
    alacritty

    noctalia-shell
    fuzzel
    waybar
    mako
    swaybg
    swaylock
    wl-clipboard
    grim
    slurp
    xwayland-satellite
    polkit_gnome
  ];

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
