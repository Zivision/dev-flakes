{
  description = "Rust Flake";

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
          # Compiler
          rustc

          # Cargo
          cargo

          # language server
          rust-analyzer
        ];
        shellHook = ''
          echo "Rust Ready!"
        '';
      };
    };
}
