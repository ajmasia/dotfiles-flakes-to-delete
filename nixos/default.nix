{ system, inputs, customModules, ... }:

let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
in
{
  drogon = nixosSystem {

    inherit system;

    specialArgs = {
      inherit inputs;
    };

    modules = [
      customModules
      ./drogon/configuration.nix
    ];
  };
}
