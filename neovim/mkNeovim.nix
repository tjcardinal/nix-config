pkgs:
{
  configure = {
    customRC = ''
      ${builtins.readFile ./config/mappings.vim}
      ${builtins.readFile ./config/options.vim}

      lua <<EOF
      ${builtins.readFile ./config/telescope.lua}
      ${builtins.readFile ./config/treesitter.lua}
      ${builtins.readFile ./config/simple_plugins.lua}
      EOF
    '';

    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        # Automatic. Set and forget
        catppuccin-nvim
        conjure
        fennel-vim
        indent-blankline-nvim
        lualine-nvim
        nvim-autopairs
        nvim-treesitter-context
        nvim-treesitter.withAllGrammars
        plenary-nvim
        which-key-nvim
        # nvim-lspconfig

        # Manual. New functionality
        telescope-nvim
        # comment-nvim
        # gitsigns-nvim
        # luasnip
        # nvim-cmp
        # nvim-lspconfig
        # nvim-surround
        # nvim-treesitter-textobjects
      ];
    };

  };
}
