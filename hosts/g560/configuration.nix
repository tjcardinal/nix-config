{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/basic.nix
    ../../modules/grub.nix
    ../../modules/nix-settings.nix
    ../../modules/user.nix
    ../../modules/audio.nix
    ../../modules/gnome.nix
    ];

    networking.hostName = "nix-laptop";

    system.autoUpgrade.flake = "github:tjcardinal/nix-config#g560";

    system.stateVersion = "22.11";
}
