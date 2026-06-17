# modules/shared/boot.nix
{...}: {
  boot.loader.timeout = 300;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev"; # REQUIRED for UEFI
    useOSProber = true;
    configurationLimit = 5;
  };
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };
}
