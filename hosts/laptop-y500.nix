{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/systemd-boot.nix
    ../modules/common.nix
    ../modules/gnome.nix
    ../modules/audio.nix
  ];

  networking.hostName = "laptop-y500";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    opengl.enable = true;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    nvidia.modesetting.enable = true;
  };

  # environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "22.11";
}
