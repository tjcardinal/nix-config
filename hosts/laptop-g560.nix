{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/gnome.nix
    ../modules/audio.nix
    ../modules/firefox.nix
    ../modules/steam.nix
  ];

  # Need grub since this is non-UEFI
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "laptop-g560";

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
