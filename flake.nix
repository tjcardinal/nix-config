{
  description = "My personal Nix config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      mkHost = import ./nixosConfigs/mkHost.nix nixpkgs system;
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        desktop = mkHost "desktop";
        laptop-g560 = mkHost "laptop-g560";
        laptop-y500 = mkHost "laptop-y500";
        server = mkHost "server";
      };
      packages.${system}.neovim = import ./neovim/neovim.nix pkgs;
    };
}
