{
  description = "Python Flake";

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
          # Basic Dependancies
          python313Packages.pip
          python313Packages.virtualenv

          # For my text editor (Emacs)
          pyright
          black
          python313Packages.pyflakes
          python313Packages.isort
          python313Packages.pytest

          # Python itself
          python313

          # Python Project Dependancies
          # python313Packages.requests for example

        ];
        shellHook = ''
          echo "Python Ready!"
        '';
      };
    };
}
