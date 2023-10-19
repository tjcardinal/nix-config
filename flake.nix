{
  description = "My personal Nix config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    nixosSystem = hostname:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./modules/common.nix
	  ./hosts/${hostname}.nix
	];
      };
  in
    {
      nixosConfigurations = {
        desktop = nixosSystem "desktop";
        server = nixosSystem "server";
        laptop-y500 = nixosSystem "laptop-y500";
        laptop-g560 = nixosSystem "laptop-g560";
      };
    };
}
