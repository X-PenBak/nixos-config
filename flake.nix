{
  description = "Colbary07 NixOS/NixOS-WSL Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = {
          # Desktop
          nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/nixos/default.nix
	      inputs.home-manager.nixosModules.home-manager
	      {
	      	home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.colbary = import ./modules/home/default.nix;
	      }
            ];
            specialArgs = { inherit inputs; };
          };
          # WSL
          nixos-wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
	      ./hosts/nixos-wsl/default.nix
              inputs.nixos-wsl.nixosModules.wsl
	      inputs.home-manager.nixosModules.home-manager
	      {
		 home-manager.useGlobalPkgs = true;
  		 home-manager.useUserPackages = true;
  		 home-manager.users.colbary = import ./modules/home/default.nix;
	      }
            ];
            specialArgs = { inherit inputs; };
          };
        };
      };
    };
}
