{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/systemd-boot.nix
  ];

  networking.hostName = "server";

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
