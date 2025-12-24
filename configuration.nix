
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

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
    ];
  };

  # touchpad support
  services.libinput.enable = true;

  programs.zsh.enable = true;
  services.upower.enable = true;

  # Remap CAPS lock to ESC
  services.udev.extraHwdb = ''
    evdev:atkbd:*
      KEYBOARD_KEY_3a=esc
  '';

#  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    clang
    llvm
    lld
    vim
    wget
    git
    zsh
    ripgrep
    pulseaudio

    # Lua
    lua-language-server

    # Python
    basedpyright
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # C/C++
    clang-tools # C/C++

    # Nix
    nil
    alejandra

    # Rust
    rust-analyzer
    rustfmt

    # Web / JS / TS
    nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted
    vscode-json-languageserver


  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?
}

