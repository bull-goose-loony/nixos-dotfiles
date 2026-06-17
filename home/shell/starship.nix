{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = "$username$hostname:$directory$git_branch$git_status$character";

      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "green bold";
      };

      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[@$hostname]($style)";
        style = "green bold";
      };

      character = {
        success_symbol = "[❯](green bold)";
        error_symbol = "[❯](red bold)";
      };

      directory = {
        truncation_length = 5;
        truncate_to_repo = false;
        home_symbol = "~";
        read_only = " ";
        style = "bold red";
      };
    };
  };
}
