nixpkgs: system: hostname:
nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    ./modules/common.nix
    ./${hostname}/${hostname}.nix
  ];
}
