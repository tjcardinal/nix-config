{
  description = "My personal Nix config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      nixosSystem = hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/common.nix
            ./hosts/${hostname}/${hostname}.nix
          ];
        };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      nixosConfigurations = {
        desktop = nixosSystem "desktop";
        server = nixosSystem "server";
        laptop-y500 = nixosSystem "laptop-y500";
        laptop-g560 = nixosSystem "laptop-g560";
      };
    };
}
