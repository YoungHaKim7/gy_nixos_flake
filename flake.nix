{
  description = "NixOS Home Manager Flake 260307";

  inputs = {
    # Use the unstable branch for packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home Manager input
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix # Your system configuration
          
          # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.myuser = import ./home.nix; # User config
          }
        ];
      };
    };
}
