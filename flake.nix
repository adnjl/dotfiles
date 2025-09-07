{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stablepkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    bleedingpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # darwin modules
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    # desktop modules
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # hyprland.url = "github:hyprwm/hyprland/v0.50.1";
    # hyprscroller = {
    #   url = "github:cpiber/hyprscroller/d3e447a22cfaae77ab1cf3931d23cfdb7c010a9c";
    #   # inputs.hyprland.follows = "hyprland";
    # };

    nix-colors.url = "github:misterio77/nix-colors";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:adnjl/wallpapers";
      flake = false;
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    {
      nixosConfigurations = {

        maau =
          let
            username = "aden";
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs;
              inherit username;
              inherit system;
            };
          in
          nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = [
              ./hosts/maau
              inputs.chaotic.nixosModules.nyx-cache
              inputs.chaotic.nixosModules.nyx-overlay
              inputs.chaotic.nixosModules.nyx-registry
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = inputs // specialArgs;
                  users.${username} = import ./users/${username}/home.nix;
                };
              }
            ];
          };

        gau =
          let
            username = "aden";
            system = "aarch64-linux";
            specialArgs = {
              inherit inputs;
              inherit username;
              inherit system;
            };
          in
          nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = [
              ./hosts/gau
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = inputs // specialArgs;
                  users.${username} = import ./users/${username}/home.nix;
                };
              }
            ];
          };
      };

      darwinConfigurations.tou =
        let
          username = "soems";
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit system;
          };
        in
        nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            ./hosts/tou

            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = inputs // specialArgs;
                users.${username} = import ./users/${username}/home.nix;
              };
            }
          ];
        };
    };

}
