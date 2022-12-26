{ system, inputs, ... }:

with inputs;
{
  ajmasia = home-manager.lib.homeManagerConfiguration rec {
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-12.2.3"
        ];
      };

      overlays = [
        (import ./ajmasia/overlays/bin.nix)
      ];
    };

    modules = [
      ./ajmasia/home.nix
    ];
  };
}
