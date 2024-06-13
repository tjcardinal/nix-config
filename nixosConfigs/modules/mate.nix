{ pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    displayManager.lightdm.enable = true;
    desktopManager.mate.enable = true;
  };

  programs.dconf.profiles.user.databases = [{
    settings = with lib.gvariant; {
    };
  }];
}
