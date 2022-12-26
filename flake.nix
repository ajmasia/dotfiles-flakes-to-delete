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
        import ./home/home-conf.nix {
          inherit system inputs;
        }
      );

      nixosConfigurations = (
        import ./nixos/nixos-conf.nix {
          inherit system inputs;
        }
      );
    };
}
