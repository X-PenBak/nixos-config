{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/default.nix
  ];

  networking.hostName = "nixos-wsl";

  wsl = {
    enable = true;
    defaultUser = "colbary";
    startMenuLaunchers = true;
  };

  users.users.colbary = {
    isNormalUser = true; 
    description = "My User";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "25.11";
}
