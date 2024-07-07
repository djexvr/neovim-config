------------------------------------
--- === Djex's Neovim Config === ---
------------------------------------

--- Load options
require("options")

--- Load mappings
require("keymaps")

--- Load plugins
require("plugins")

--- Load colorscheme
require("colorscheme")

--- === Plugin Configuration ===

--- Gitsigns
require("gitsigns").setup()

--- Lualine
require("lualine").setup({
	options = {
		theme = "ayu",
	},
})

--- Treesitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

--- Headlines
require("headlines").setup({
	markdown = {
		fat_headlines = false,
	},
})
