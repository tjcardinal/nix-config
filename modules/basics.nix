{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ neovim git tmux htop ];
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.printing.enable = true;
  time.timeZone = "America/Chicago";
}
