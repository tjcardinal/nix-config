{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = with pkgs; [ xterm ];
  };

  environment.gnome.excludePackages = with pkgs; [ gnome-tour ];
}
