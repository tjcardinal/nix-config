{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = with pkgs; [ xterm ];

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;
  };
}
