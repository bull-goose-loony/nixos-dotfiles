{ pkgs, ... }: {
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.zsh.initContent = ''
    if command -v fastfetch >/dev/null 2>&1; then
      fastfetch --logo-type small
    fi
  '';
}
