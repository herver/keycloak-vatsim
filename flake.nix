{
  description = "Keycloak Social Login extension for VATSIM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jdk = pkgs.jdk17;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            jdk
            pkgs.maven
            pkgs.nodejs_20
            pkgs.yarn
          ];

          shellHook = ''
            export JAVA_HOME="${jdk.home}"
          '';
        };
      }
    );
}
