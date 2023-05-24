{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/audio.nix
    ../modules/common.nix
    ../modules/gnome.nix
    ../modules/grub.nix
    ../modules/user.nix
  ];

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    operation = "switch";
    flake = "github:tjcardinal/nix-config#laptop-g560";
  };

  networking.hostName = "nixos-g560";

  # environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
