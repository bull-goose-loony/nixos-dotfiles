#
# I had chat generate this. I gave it my .zshrc and .zsh_aliases
# and it gave me this.
#

{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

  };
}
