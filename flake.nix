{
  description = "My personal Nix config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      host = import ./nixosConfigs/hosts/host.nix nixpkgs system;
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        desktop = host "desktop";
        laptop-g560 = host "laptop-g560";
        laptop-y500 = host "laptop-y500";
        server = host "server";
      };
      packages.${system}.neovim = import ./neovim/neovim.nix pkgs;
    };
}
