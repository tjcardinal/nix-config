pkgs:
let
  myConfig = pkgs.runCommand "myNeovimConfig" { } ''
    mkdir -p $out
    cp -r ${./.}/init.lua $out/
    cp -r ${./.}/lua $out/
  '';

  myPlugins = with pkgs.vimPlugins; [
    # Automatic. Set and forget
    lazy-nvim
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

  myNeovim = pkgs.neovim.override {
    configure = {
      customRC = ''
        lua vim.g.is_nix = true
        lua vim.opt.rtp:prepend("${myConfig}")
        luafile ${myConfig}/init.lua
      '';

      packages.myPackages = {
        start = myPlugins;
      };
    };
  };

  runtimeDependencies = with pkgs; [ myConfig go ];

in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = runtimeDependencies;
  text = ''
    	${myNeovim}/bin/nvim "$@"
  '';
}
