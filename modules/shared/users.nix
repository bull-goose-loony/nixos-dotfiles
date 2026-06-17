{pkgs, ...}: {
  users.users.zach = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];

    openssh.authorizedKeys.keys = [
      # "ssh-ed25519 <some-public-key> zach@thinkpad"
    ];
  };
}
