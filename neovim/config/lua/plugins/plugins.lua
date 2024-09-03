return {
	{
		"tpope/vim-sleuth",
		dev = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dev = true,
		opts = {
			options = {
				icons_enabled = vim.g.have_nerd_font,
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dev = true,
		main = "ibl",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		dev = true,
		dependencies = { "hrsh7th/nvim-cmp", dev = true },
		event = "InsertEnter",
		opts = {},
		config = function()
			require("nvim-autopairs").setup({})
			-- Automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"catppuccin/nvim",
		dev = true,
		name = "catppuccin-nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dev = true,
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim", dev = true },
		opts = {
			signs = false,
		},
	},
	{
		"numToStr/comment.nvim",
		dev = true,
		opts = {},
	},
}
