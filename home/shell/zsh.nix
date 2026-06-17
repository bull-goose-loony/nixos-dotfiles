#
# I had chat generate this. I gave it my .zshrc and .zsh_aliases
# and it gave me this.
#
{pkgs, ...}: {
  programs.zsh = {
    enable = true; # This is user-level, zsh needs to be enabled at system-level also
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # colorize help pages
            alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
            alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

            source <(fzf --zsh)

            function jb(){
              journalctl -a -b -u "$1" | less +G
            }

          function jub(){
            journalctl --user -a -b -u "$1" | less +G
          }

          function jf(){
            journalctl -a -f -u "$1"
          }

          function juf(){
            journalctl --user -a -f -u "$1"
          }
    '';
  };
}
