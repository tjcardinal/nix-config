{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/gnome.nix
    ../../modules/grub.nix
    ../../modules/networking.nix
    ../../modules/nix-settings.nix
    ../../modules/pipewire.nix
    ../../modules/printing.nix
    ../../modules/timezone.nix
    ../../modules/user-tylerc.nix
    ];

    networking.hostName = "nix-laptop";

    system.autoUpgrade.flake = "github:tjcardinal/nix-config#laptop";

    system.stateVersion = "22.11";
}
