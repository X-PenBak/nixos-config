{ config, pkgs, inputs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  networking.hostName = "nixos";

  # 原生机器需要 Bootloader
  boot.loader.systemd-boot.enable = true;
  

  # 用户配置
  users.users.colbary = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

}
