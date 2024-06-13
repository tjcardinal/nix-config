{ pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };



}
