pkgs:
{
  configure = {
    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        nvim-treesitter.withAllGrammars
        # nvim-cmp
        # which-key-nvim
        # plenary-nvim
        # telescope-nvim
        # nvim-lspconfig
        # catppuccin-nvim
        # indent-blankline-nvim
        # lualine-nvim
        # comment-nvim
        # nvim-autopairs
        # nvim-surround
        # nvim-treesitter-context
      ];
    };

    customRC = ''
              " Display changes
              set number
              set relativenumber

              nnoremap <leader>ff <cmd>Telescope find_files<cr>

              set cursorline

              " cursorcolumn doesn't work with vscode-neovim
              if !exists('g:vscode')
                set cursorcolumn
              endif

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

      lua <<EOF
      EOF
    '';
  };
}
