{ config, pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
  ];

  home.username = "colbary";
  home.homeDirectory = "/home/colbary";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    bat
    eza
    ripgrep
    fzf
    nil
    nixd
  ];
}
