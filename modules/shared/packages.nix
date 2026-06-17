{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    vim
    wget
    git
    pulseaudio
    parted
    efibootmgr
  ];
}
