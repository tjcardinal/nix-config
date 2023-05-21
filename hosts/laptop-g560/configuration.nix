{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/basics.nix
    ../../modules/browser.nix
    ../../modules/gnome.nix
    ../../modules/grub.nix
    ../../modules/nix-settings.nix
    ../../modules/user.nix
    ];

    networking.hostName = "nixos-g560";

    system.autoUpgrade.flake = "github:tjcardinal/nix-config#laptop-g560";

    system.stateVersion = "22.11";
}
