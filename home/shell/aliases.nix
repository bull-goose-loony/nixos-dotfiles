{pkgs, ...}: {
  programs.zsh.shellAliases = {
    # General
    why = "ncdu";
    h = "history";
    down = "sudo shutdown now";

    # NixOS
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";

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
}
