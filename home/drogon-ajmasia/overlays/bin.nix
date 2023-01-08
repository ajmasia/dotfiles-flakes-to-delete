self: super: {
  ajmasia-bin = super.stdenv.mkDerivation {
    name = "ajmasia-binaries";

    src = ../bin;

    dontPatchShebangs = true;

    installPhase = ''
      mkdir -p $out/bin
      mv * $out/bin
    '';

  };
}
