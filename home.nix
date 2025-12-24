{ config, pkgs, ... }:
{
    home.username = "zach";
    home.homeDirectory = "/home/zach";
    home.stateVersion = "25.11";
    home.keyboard.options = [ "caps:escape" ];
#    programs.zsh = {
# enable = true;
# profileExtra = ''
#   exec hyprland
# '';
#    };
    #home.file.".config/hypr".source = ./config/hypr;

    home.packages = with pkgs; [
      ghostty
      waybar
      yazi
      hyprpaper
	    neovim
      upower
      wlr-randr
	    rofi
	    tmux
	    stow
	    fastfetch
	    starship
	    zoxide
	    fzf
	    bat
	    eza
	    zsh-syntax-highlighting
      grim
      slurp
      wl-clipboard
      tldr
      font-awesome
      nerd-fonts.jetbrains-mono
    ];
}
