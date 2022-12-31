{ system, inputs, ... }:

let
  ajmasiaConfigPath = "ajmasia-xmonad";
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
        (import ./${ajmasiaConfigPath}/overlays/bin.nix)
      ];
    };

    modules = [
      ./${ajmasiaConfigPath}/home.nix
    ];
  };
}

