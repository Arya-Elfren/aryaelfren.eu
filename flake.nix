{
  description = "First aryaelfren html output";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.site = (
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
        pkgs.stdenv.mkDerivation {
          name = "aryaelfren.eu";
          src = ./.;
          buildInputs = with pkgs; [];
          phases = ["buildPhase"];
            buildPhase = ''
              mkdir -p $out
              echo "test" > $out/index.html
            '';
          }
        );

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.site;
  };
}
