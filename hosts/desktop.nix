{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/audio.nix
    ../modules/common.nix
    ../modules/gnome.nix
    ../modules/systemd-boot.nix
    ../modules/user.nix
  ];

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    operation = "boot";
    flake = "github:tjcardinal/nix-config#desktop";
  };

  networking.hostName = "nixos-desktop";

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
