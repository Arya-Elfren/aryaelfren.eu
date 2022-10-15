{
  description = "First aryaelfren html output";

  outputs = { self, nixpkgs }: {
    defaultPackage."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".stdenv.mkDerivation {
      name = "aryaelfren.eu";
      src = ./.;
      # nativeBuildInputs = with nixpkgs; [];
      phases = ["buildPhase"];
      buildPhase = ''
        mkdir -p $out
        echo "test" > $out/index.html
      '';
    };
  };
}
