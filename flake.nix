{
  description = "My personal Nix config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      mkHost = import ./nixosConfigs/mkHost.nix nixpkgs system;
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        desktop = mkHost "desktop";
        laptop-g560 = mkHost "laptop-g560";
        laptop-y500 = mkHost "laptop-y500";
        server = mkHost "server";
      };
    };
}
