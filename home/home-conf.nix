{ system, inputs, ... }:

let
  ajmasiaConfigPath = "drogon-ajmasia";
in
with inputs;
{
  # drogon-ajmasia
  ajmasia = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};

    modules = [
      ./${ajmasiaConfigPath}/home.nix
    ];
  };
}

