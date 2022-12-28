{ system, inputs, ... }:

let
  userConfigPath = "drogon-ajmasia";
in 
with inputs;
{
  # drogon-ajmasia
  ajmasia = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-12.2.3"
        ];
      };

      overlays = [
        (import ./${userConfigPath}/overlays/bin.nix)
      ];
    };

    modules = [
      ./${userConfigPath}/home.nix
    ];
  };
}

