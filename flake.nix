{
  description = "My awesome system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bazecor-nix = {
      url = "github:ajmasia/bazecor-nix";
    };

    amd-controller = {
      type = "github";
      owner = "ajmasia";
      repo = "amd-controller";
      ref = "implement_multi_processor-config";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }:

    let
      system = "x86_64-linux";
      customModules = {
        # Configuración de NixOS
        imports = [
          inputs.amd-controller.module
        ];
      };
    in
    {
      homeConfigurations = (
        import ./home/home-conf.nix {
          inherit system inputs;
        }
      );

      nixosConfigurations = (
        import ./nixos/nixos-conf.nix {
          inherit system inputs customModules;
        }
      );
    };
}
