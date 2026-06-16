{pkgs, ... }: {

  home.sessionVariables = {
    HOME = "/home/zach";
    EDITOR = "nvim";
    TEXT_EDITOR = "nvim";
    TERM = "alacritty";
    HISTCONTROL = "ignoreboth";

    RUST_LOG="debug cargo run";

    KEYMAP_DIR = "$HOME/qmk_firmware/keyboards/ergodox_ez/keymaps/zachs_keymap";
    DOTFILE_DIR = "$HOME/.cfg";
    TERM_CONF = "$HOME/.config/ghostty/config";

    FZF_DEFAULT_OPTS = ''
      --height 40%
      --layout=reverse
      --border
      --border-label='FZF'
      --border=rounded
      --margin=1
      --preview-window=hidden
      '';

    FZF_CTRL_T_OPTS = ''
      --walker-skip .git,node_modules,target
      --preview 'bat -n --color=always {}'
      --bind 'ctrl-/:change-preview-window(down|hidden|)'
      '';

    FZF_CTRL_R_OPTS = ''
      --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
      --color header:italic
      --header 'Press CTRL-Y to copy command into clipboard'
      '';

    FZF_ALT_C_OPTS = ''
      --walker-skip .git,node_modules,target
      --preview 'tree -C {}'
      '';
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];
              }

