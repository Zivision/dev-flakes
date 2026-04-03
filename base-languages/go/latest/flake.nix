{
  description = "Go Flake";

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
          # Go compiler
          go

          # Tools for emacs
          gomodifytags
          gotests
          gore
          gopls
          delve
        ];
        shellHook = ''
          echo "Go Ready!"
        '';
      };
    };
}
