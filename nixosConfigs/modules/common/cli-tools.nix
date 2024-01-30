{ pkgs, ... }:
{
  programs = {
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

        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";
        delta.navigate = true;
        delta.light = false;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
      };
    };

    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };

    direnv.enable = true;

    starship.enable = true;

    htop.enable = true;

    bash.interactiveShellInit = ''
      eval "$(zoxide init bash)"
    '';

  };

  environment.systemPackages = with pkgs; [ ripgrep fd bat tealdeer tree delta zoxide eza lsd ];
}
