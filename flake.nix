{
  description = "Command Line Interface and library for Communications with Espruino JavaScript Microcontrollers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    nodePackage = pkgs.callPackage ./default.nix {};
  in {
    packages.${system} = {
      inherit (nodePackage) tarball;
      default = nodePackage.package;
    };
    devShells.x86_64-linux.default = nodePackage.shell;
  };
}
