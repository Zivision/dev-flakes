{
  description = "Haskell Flake";

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
          # Compilier
          ghc

          # Stack and cabal (just in case)
          haskellPackages.stack
          haskellPackages.cabal-install

          # Tools for Emacs
          haskellPackages.hoogle
          haskellPackages.haskell-language-server
        ];
        shellHook = ''
          echo "Haskell Ready!"
        '';
      };
    };
}
