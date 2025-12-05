{ pkgs, ... }:
{
  # --- Fish ---
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  # --- Starship ---
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
         success_symbol = "[  ➜ ](bold cyan)";
         error_symbol = "[  ➜ ](bold red)";
      };
      nix_shell = {
         disabled = false;
      };
       package.disabled = true;
    };
  };
}
