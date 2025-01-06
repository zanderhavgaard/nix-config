{
  description = "Nixos with flakes experiment";

  inputs = {
    # setup stable nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # setup unstable nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # setup home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # make home-manager use the same nixpkgs as the flake
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        orion = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/orion/configuration.nix

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/orion/home.nix;
            }
          ];
        };
        gemini = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/gemini/configuration.nix

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/gemini/home.nix;
            }
          ];
        };
        prometheus = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/prometheus/configuration.nix

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/prometheus/home.nix;
            }
          ];
        };
        phobos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/phobos/configuration.nix

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/phobos/home.nix;
            }
          ];
        };
      };
    };
}
