{pkgs, ... }: {

  programs.zsh.shellAliases = {
# Resume
    br = "cd ~/resume && pdflatex resume.tex && evince resume.pdf";

# General
    cd = "z";
    swapscreen = "xrandr --output HDMI-1 --left-of DP-2";
    wmconf = "$TEXT_EDITOR $WM_CONF";
    why = "ncdu";
    h = "history";
    postgres = "sudo -i -u postgres";
    bdb = "psql -U postgres -d budgetdb";
    bdbload = "psql -U postgres -d budgetdb -f /home/zach/src/personal-budget/budget-backend/init_db.sql";
    down = "sudo shutdown now";
    termconf = "$TEXT_EDITOR $TERM_CONF";

# NixOS
    nrsf = "sudo nixos-rebuild switch --flake";

# Pacman leftovers
    sps = "sudo pacman -S";
    spsy = "sudo pacman -Sy";
    spsu = "sudo pacman -Su";
    spsyyu = "sudo pacman -Syyu";

# Keyboard
    ke = "cd $KEYMAP_DIR && vim .";
    kf = "cd $KEYMAP_DIR && qmk flash -kb ergodox_ez -km zachs_keymap && cd -";
    kc = "cd $KEYMAP_DIR && qmk compile -kb ergodox_ez -km zachs_keymap && cd -";

# Configs
    al = "$TEXT_EDITOR ~/.zsh_aliases";
    ale = "cat ~/.zsh_aliases";
    env = "$TEXT_EDITOR $HOME/.zshenv";
    sauce = "source $HOME/.zshrc";
    vrc = "cd $XDG_CONFIG_HOME/nvim; nvim .";

# Overwrites
    grep = "rg";
    ps = "ps -au";
    psa = "ps -au";
    vim = "$TEXT_EDITOR";

## ls
    ls = "eza -lh --group-directories-first --icons=auto";
    ll = "eza --long --all --git";
    lt = "eza --long --tree --level=3";

# cat
    cat = "bat";

# Programming
    py = "python3";

# Git
    gco = "git checkout";
    gcob = "git checkout -b";
    gs = "git status -s";
    gp = "git push";
    ga = "git add .";
    gcm = "git commit -m";
    gd = "git diff --name-only --relative --diff-filter=d -z | xargs -0 bat --diff";

# Rust
    ctl = "cargo test -- --nocapture";

    show_keycodes = "sudo libinput debug-events --show-keycodes";
  };

  programs.zsh.initContent = ''
# colorize man pages
    export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

# colorize help pages
    alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# fzf shell integration
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
}
