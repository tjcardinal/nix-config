{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
    persistent = true;
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";:
    operation = "switch";
    persistent = true;
    allowReboot = true;
  };

  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.printing.enable = true;
  time.timeZone = "America/Chicago";

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    tmux = {
      enable = true;
      clock24 = true;
    };

    git.enable = true;
    htop.enable = true;
  };

  # environment.systemPackages = with pkgs; [ ];
}
