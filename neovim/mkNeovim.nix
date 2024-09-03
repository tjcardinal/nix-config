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
          catppuccin-nvim
          comment-nvim
          conform-nvim
          gitsigns-nvim
          indent-blankline-nvim
          lualine-nvim
          nvim-autopairs
          nvim-treesitter-context
          nvim-treesitter-textobjects
          nvim-treesitter.withAllGrammars
          plenary-nvim
          todo-comments-nvim
          vim-sleuth
          which-key-nvim
          telescope-fzf-native-nvim
          telescope-ui-select-nvim

          # not configured yet
          nvim-lspconfig
          nvim-cmp
          telescope-nvim
          luasnip
          nvim-web-devicons
          friendly-snippets

          mini-nvim

          # nvim-surround
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
