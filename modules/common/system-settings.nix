{ pkgs, ... }:
{
  networking.networkmanager.enable = true;

  services = {
    openssh.enable = true;

    printing.enable = true;
    printing.drivers = [ pkgs.gutenprint ];
  };

  time.timeZone = "America/Chicago";
}
