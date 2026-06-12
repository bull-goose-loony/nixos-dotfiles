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
    configurationLimit = 5;
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  # Network
  networking.hostName = "my-nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  services.getty.autologinUser = "zach";

  programs.zsh.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  # This allows me to SSH into this machine from any machine
  # that has the public key defined in users.users.zach
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  #  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "docker"]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      #ssh-ed25519 <some-public-key> zach@thinkpad
    ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  # Have nix auto-collect old garbage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

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
