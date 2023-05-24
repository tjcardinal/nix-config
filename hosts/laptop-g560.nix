{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/common.nix
    ../../modules/gnome.nix
    ../../modules/grub.nix
    ../../modules/user.nix
    ];

    # environment.systemPackages = with pkgs; [ ];

    networking.hostName = "nixos-g560";

    system.autoUpgrade = {
      enable = true;
      dates = "weekly";
      operation = "switch";
      flake = "github:tjcardinal/nix-config#laptop-g560";
    };

    system.stateVersion = "22.11";
}
