{
  description = "A collection of various modern block game rules, more ways to play, and some new things added for a new experience.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    genSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];
    pkgs = genSystems (system: import nixpkgs {inherit system;});
  in {
    packages = genSystems (system: {
        default = pkgs.${system}.callPackage ./techmino {};
    });
  };
}
