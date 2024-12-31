{
  description = "My personal Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim.url = "github:tjcardinal/nvim-config";
    neovim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      neovim,
    }:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
      mkNixosConfiguration =
        host:
        nixpkgs.lib.nixosSystem {
          modules = [
            (
              { ... }:
              {
                networking.hostName = host;
              }
            )
            ./hosts/${host}
            ./modules/common
          ];
        };
      mkNixosConfigurations = hosts: builtins.mapAttrs (host: _: mkNixosConfiguration host) hosts;
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations = mkNixosConfigurations (builtins.readDir ./hosts);
      packages.${system}.neovim = neovim.packages.${system}.default;
    };
}
