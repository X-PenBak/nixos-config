{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  # Bootloader
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = [ "nodev" ];
        theme = pkgs.minimal-grub-theme;
      };
    };
  };

  # hostname
  networking.hostname = "nixos";
  networking.networkmanager.enable = true;

  # User Configuration
  users.users.colbary = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };
}
