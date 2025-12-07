{ pkgs, ... }:
{

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Asia/Shanghai";

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    zed-editor
  ];

  programs.fish.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
  ];
}
