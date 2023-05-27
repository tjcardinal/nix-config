{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/grub.nix
    ../modules/common.nix
    ../modules/gnome.nix
    ../modules/audio.nix
  ];

  networking.hostName = "laptop-g560";

  # environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
