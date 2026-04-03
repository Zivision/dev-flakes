{
  description = "Clojure Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # Uncomment for either runtime
          # clojure
          # babashka

          # Tools for emacs
          # Formatter
          cljfmt
          clj-kondo

        ];
        shellHook = ''
          echo "Clojure Ready!"
        '';
      };
    };
}
