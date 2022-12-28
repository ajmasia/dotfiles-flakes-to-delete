{ system, inputs, ... }:

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
      ./drogon/configuration.nix
    ];
  };
}
