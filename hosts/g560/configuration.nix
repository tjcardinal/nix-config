{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/basic.nix
    ../../modules/browser.nix
    ../../modules/gnome.nix
    ../../modules/grub.nix
    ../../modules/nix-settings.nix
    ../../modules/user.nix
    ];

    networking.hostName = "nixos-g560";

    system.autoUpgrade.flake = "github:tjcardinal/nix-config#g560";

    system.stateVersion = "22.11";
}
