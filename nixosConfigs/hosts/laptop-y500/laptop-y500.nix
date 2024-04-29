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
    opengl.enable = true;
    # Need to remove /lib/systemd/system-sleep/nvidia to prevent nvidia force resuming on suspend
    nvidia.package = (config.boot.kernelPackages.nvidiaPackages.legacy_470.overrideAttrs (prevAttrs: {
      postInstall = (toString prevAttrs.postInstall) + ''
        rm $out/lib/systemd/system-sleep/nvidia
      '';
    }));
    nvidia.modesetting.enable = true;
  };
  nixpkgs.config.nvidia.acceptLicense = true;

  # Disable nvidia services to force kernel driver callback to manage power management
  # Using these can prevent waking from suspend when using nvidia 470
  systemd.services.nvidia-hibernate.enable = false;
  systemd.services.nvidia-resume.enable = false;
  systemd.services.nvidia-suspend.enable = false;

  # Wayland needs to be disable since nvidia 470 doesn't work well with it
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.wayland = false;
  };

  system.stateVersion = "22.11";
}
