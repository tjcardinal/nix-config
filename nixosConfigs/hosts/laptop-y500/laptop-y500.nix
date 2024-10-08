{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/systemd-boot.nix
    ../../modules/gnome.nix
    ../../modules/audio.nix
    ../../modules/firefox.nix
    ../../modules/steam.nix
    ../../modules/dev.nix
  ];

  networking.hostName = "laptop-y500";

  hardware.bluetooth.enable = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # nvidia = {
    #   package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    #   modesetting.enable = true;
    #   powerManagement.enable = true;
    # };
  };
  # nixpkgs.config.nvidia.acceptLicense = true;
  # environment.sessionVariables = {
  #   GSK_RENDERER = "gl";
  # };

  # Need to turn bluetooth off when suspending to prevent freezes
  # powerManagement.powerUpCommands = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
  powerManagement.powerDownCommands = "${pkgs.util-linux}/bin/rfkill block bluetooth";

  # Wayland needs to be disable since nvidia 470 doesn't work well with it
  services.xserver = {
    # videoDrivers = [ "nvidia" ];
    displayManager.gdm.wayland = false;
  };

  system.stateVersion = "22.11";
}
