pkgs:
let
  myNeovim = pkgs.neovim.override {
    configure = {
      customRC = ''
        lua vim.g.is_nix = true
        lua vim.g.plugin_path = vim.api.nvim_get_runtime_file('pack/*/start/', false)[1]
        lua vim.opt.rtp:prepend("${./.}")
        luafile ${./.}/init.lua
      '';

      packages.myPackages = with pkgs.vimPlugins; {
        start = [ lazy-nvim ];
        opt = [
          # Automatic. Set and forget
          neo-tree-nvim
          vim-sleuth
          catppuccin-nvim
          # conjure
          # fennel-vim
          indent-blankline-nvim
          lualine-nvim
          # nvim-autopairs
          # nvim-treesitter-context
          # nvim-treesitter.withAllGrammars
          # plenary-nvim
          # which-key-nvim
          # nvim-lspconfig
          #
          # # Manual. New functionality
          # telescope-nvim
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
