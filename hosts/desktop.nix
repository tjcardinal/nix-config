{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/systemd-boot.nix
    ../modules/gnome.nix
    ../modules/audio.nix
    ../modules/firefox.nix
    ../modules/steam.nix
  ];

  networking.hostName = "desktop";

  # Use boot over switch to reduce disruption while playing games
  system.autoUpgrade.operation = "boot";

  environment.systemPackages = with pkgs; [ steam-run sunshine ];

  system.stateVersion = "22.11";
}
