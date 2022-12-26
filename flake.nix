{
  description = "My awesome system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;
    in
    {
      homeConfigurations = (
        import ./users/users-conf.nix {
          inherit system inputs;
        }
      );

      nixosConfigurations = {
        drogon = lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = [
            ({ pkgs, ... }: {
              # Make ready for nix flakes
              nix = {
                extraOptions = "experimental-features = nix-command flakes";
                package = pkgs.nixFlakes;
                registry.nixpkgs.flake = nixpkgs;
              };
            })

            ./system/drogon/configuration.nix
          ];
        };
      };
    };
}
