{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    operation = "switch";
    flake = "github:tjcardinal/nix-config";
    flags = [ "--impure" ];
  };

  users.users.tylerc = {
    isNormalUser = true;
    description = "Tyler Cardinal";
    extraGroups = [ "networkmanager" "wheel" ];
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

    git = {
      enable = true;
      config = {
	credential.helper = "store";
        init.defaultBranch = "main";
	user.email = "83625450+tjcardinal@users.noreply.github.com";
	user.name = "Tyler Cardinal";
      };
    };

    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };

  };

  environment.systemPackages = with pkgs; [ ripgrep fd bat fzf ];
}
