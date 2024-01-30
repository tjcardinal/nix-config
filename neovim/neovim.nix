pkgs:
pkgs.neovim.override {
  configure = {
    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        nvim-treesitter.withAllGrammars
        # nvim-cmp
        which-key-nvim
        plenary-nvim
        telescope-nvim
        nvim-lspconfig
        onedark-nvim
        indent-blankline-nvim
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
              require 'ibl'.setup()

                
              require 'nvim-treesitter.configs'.setup {
                      highlight = {
                              enable = true
                      },
                      indent = {
                              enable = true
                      },
              }
              require 'which-key'.setup {}
              require'lspconfig'.rust_analyzer.setup{}

      EOF
    '';
  };
}
