pkgs:
let
  myNeovim = pkgs.neovim.override {
    configure = {
      customRC = ''
        lua vim.g.is_nix = true
        lua vim.g.plugin_path = vim.api.nvim_get_runtime_file('pack/*/opt/', false)[1]
        lua vim.opt.rtp:prepend("${./config}")
        luafile ${./config}/init.lua
      '';

      packages.myPackages = with pkgs.vimPlugins; {
        start = [ lazy-nvim ];
        opt = [
	  vim-sleuth
	  gitsigns-nvim
          which-key-nvim
          telescope-nvim
          nvim-lspconfig
	  conform-nvim
	  nvim-cmp
          catppuccin-nvim
	  todo-comments-nvim
	  mini-nvim
          nvim-treesitter.withAllGrammars
	  plenary-nvim
          nvim-autopairs

          indent-blankline-nvim
	  friendly-snippets



          # neo-tree-nvim
          # conjure
          # fennel-vim
          lualine-nvim
          # nvim-treesitter-context

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
  };
in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = with pkgs; [ ];
  text = ''
    ${myNeovim}/bin/nvim "$@"
  '';
}
