{ config, lib, pkgs, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
      ./niri-setup.nix
      ./laptop.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

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

# This hostname can be whatever, doesn't need to match the Nix Flake host 
  networking.hostName = "zachs-nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

# Have nix auto-collect old garbage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
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
  services.getty.autologinUser = "zach";

#  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "docker"]; # Enable ‘sudo’ for the user.
      openssh.authorizedKeys.keys = [
#ssh-ed25519 <some-public-key> zach@thinkpad
      ];
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    brightnessctl
      vim
      wget
      git
      pulseaudio
      parted
      efibootmgr

      # Here, the helix package is installed from the helix input data source
      # inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix
  ];

# This has nothing to do with dependency versions, it's just
# there to inform the system on what would be most compatible
  system.stateVersion = "25.11"; # Did you read the comment?
}
