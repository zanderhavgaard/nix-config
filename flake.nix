{
  description = "Nixos with flakes experiment";

  inputs = {
    # setup stable nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # setup home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # make home-manager use the same nixpkgs as the flake
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
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
      };
    };
}
