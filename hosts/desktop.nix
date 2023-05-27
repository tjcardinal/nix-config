{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/systemd-boot.nix
    ../modules/common.nix
    ../modules/gnome.nix
    ../modules/audio.nix
  ];

  system.autoUpgrade.operation = "boot";

  networking.hostName = "desktop";

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [ steam-run sunshine ];

  system.stateVersion = "22.11";
}
