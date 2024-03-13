pkgs:
{
  configure = {
    customRC = ''
      ${builtins.readFile ./config/mappings.vim}
      ${builtins.readFile ./config/options.vim}

      lua <<EOF
      ${builtins.readFile ./config/telescope.lua}
      ${builtins.readFile ./config/treesitter.lua}
      require'ibl'.setup()
      require'lualine'.setup()
      require'nvim-autopairs'.setup()
      require'which-key'.setup()
      vim.cmd.colorscheme "catppuccin-mocha"
      EOF
    '';

    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        # Automatic. Set and forget
        catppuccin-nvim
        fennel-vim
	conjure
        indent-blankline-nvim
        lualine-nvim
        nvim-autopairs
        nvim-treesitter-context
        nvim-treesitter.withAllGrammars
        plenary-nvim
        which-key-nvim

        # Manual. New functionality
        telescope-nvim
        # gitsigns-nvim
        # luasnip
        # nvim-treesitter-textobjects
        # comment-nvim
        # nvim-cmp
        # nvim-lspconfig
        # nvim-surround
      ];
    };

  };
}
