{ pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      configure.customRC = ''
        " Display changes
        set number
        set relativenumber

        set cursorline
        set cursorcolumn

        set linebreak

        " Functional changes
        set ignorecase
        set smartcase

        set splitbelow
        set splitright

        set scrolloff=5

        inoremap jk <ESC>
        nnoremap j gj
        nnoremap k gk
      '';
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
