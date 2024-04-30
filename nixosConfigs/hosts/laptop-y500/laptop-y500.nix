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
    # Need to use 470.223.02 since 470.239.06 breaks suspend/resume
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "470.223.02";
      sha256_64bit = "sha256-s2hi1TNsw+br6Ow6tPiFsYPaJY8d+x4FrkBrP2xNRPg=";
      sha256_aarch64 = "sha256-CFkg2ARlGWqlFQKm8SlbwMH6eLidHKA/q5QGVOpPGuU=";
      settingsSha256 = "sha256-r6DuIH/rnsCm/y51iRgPNi5/kz+EFMVABREdTjBneZ0=";
      persistencedSha256 = "sha256-e71fpPBBv8S/aoeXxBXkzKy5bsMMbv8y024cSLc8DYc=";
      patches = [];
    };
    nvidia.modesetting.enable = true;
  };
  nixpkgs.config.nvidia.acceptLicense = true;

  # Wayland needs to be disable since nvidia 470 doesn't work well with it
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.wayland = false;
  };

  system.stateVersion = "22.11";
}
