{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/systemd-boot.nix
    ../../modules/gnome.nix
    ../../modules/audio.nix
    ../../modules/firefox.nix
    ../../modules/steam.nix
  ];

  networking.hostName = "laptop-y500";

  hardware.bluetooth.enable = true;

  # Wayland needs to be disable since nvidia 470 doesn't work well with it
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.wayland = false;
  };
  hardware = {
    opengl.enable = true;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    nvidia.modesetting.enable = true;
  };

  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
