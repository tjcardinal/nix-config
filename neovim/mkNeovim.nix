pkgs:
{
  configure = {
    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        # comment-nvim
        # nvim-cmp
        # nvim-lspconfig
        # nvim-surround
        catppuccin-nvim
        indent-blankline-nvim
        lualine-nvim
        nvim-autopairs
        nvim-treesitter-context
        nvim-treesitter.withAllGrammars
        plenary-nvim
        telescope-nvim
        which-key-nvim
      ];
    };

    customRC = ''
      lua <<EOF
      ${builtin.readFile ./config/telescope.lua}
      ${builtin.readFile ./config/treesitter.lua}
      require'ibl'.setup()
      require'lualine'.setup()
      require'nvim-autopairs'.setup()
      require'which-key'.setup()
      vim.cmd.colorscheme "catppuccin"
      EOF
    '';
  };
}
