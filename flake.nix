{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stablepkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    bleedingpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # darwin modules
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
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

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:somenians/wallpapers";
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
            inherit specialArgs;
            modules = [
              ./hosts/maau
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
            inherit specialArgs;
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

        # niu =
        #   let
        #     username = "aden";
        #     system = "aarch64-darwin";
        #     specialArgs = {
        #       inherit inputs;
        #       inherit username;
        #       inherit system;
        #     };
        #   in
        #   nixpkgs.lib.nixosSystem {
        #     inherit specialArgs;
        #     modules = [
        #       ./hosts/niu
        #       home-manager.nixosModules.home-manager
        #       {
        #         home-manager = {
        #           useGlobalPkgs = true;
        #           useUserPackages = true;
        #           extraSpecialArgs = inputs // specialArgs;
        #           users.${username} = import ./users/${username}/darwin-home.nix;
        #         };
        #       }
        #     ];
        #   };
      };
      darwinConfigurations.niu =
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
            ./hosts/niu
            home-manager.darwinModules.home-manager
            {
              home-manager = {

                # users.users.${username}.home = "/Users/soems";
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
