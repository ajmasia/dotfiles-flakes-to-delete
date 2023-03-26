let
  excludedFiles = [ "amd-controller" ];

  filterExcludedFiles = path: type:
    !(builtins.elem (baseNameOf path) excludedFiles);
in
self: super: {
  ajmasia-bin = super.stdenv.mkDerivation {
    name = "ajmasia-binaries";

    src = builtins.filterSource filterExcludedFiles ../bin;

    dontPatchShebangs = true;

    installPhase = ''
      mkdir -p $out/bin
      mv * $out/bin
    '';
  };
}
