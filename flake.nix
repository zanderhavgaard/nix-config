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

    # community hardware configurations
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # build neovim from git
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-hardware,
      neovim-nightly-overlay,
      ...
    }:
    {
      nixosConfigurations = {
        orion = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/orion/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t490

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/orion/home.nix;
            }
          ];
        };
        phobos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/phobos/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x250

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/phobos/home.nix;
            }
          ];
        };
        gemini = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/gemini/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen5

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
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/prometheus/configuration.nix
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-cpu-amd-pstate
            nixos-hardware.nixosModules.common-cpu-amd-zenpower
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc
            nixos-hardware.nixosModules.common-pc-ssd

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/prometheus/home.nix;
            }
          ];
        };
        venera = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/venera/configuration.nix
            nixos-hardware.nixosModules.dell-xps-15-9520
            nixos-hardware.nixosModules.dell-xps-15-9520-nvidia

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/venera/home.nix;
            }
          ];
        };
        vostok = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/vostok/configuration.nix
            # There is no Thinkpad T470 module
            nixos-hardware.nixosModules.common-cpu-intel
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-ssd

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.zander = import ./hosts/vostok/home.nix;
            }
          ];
        };
      };
    };
}
