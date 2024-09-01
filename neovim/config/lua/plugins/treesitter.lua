return {
	"nvim-treesitter/nvim-treesitter",
	build = (not vim.g.is_nix and ":TSUpdate") or nil,
	opts = {
		highlight = {
			enable = true,
		},
	},
	dev = true,
}
