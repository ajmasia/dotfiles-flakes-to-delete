self: super: {
  ajmasia-bin = super.stdenv.mkDerivation {
    name = "ajmasia-bin";

    src = ../bin;

    dontPatchShebangs = true;

    installPhase = ''
      mkdir -p $out/bin
      mv * $out/bin
    '';

  };
}
