{...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

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
  programs.zsh.enable = true;
  programs.firefox.enable = true;
}
