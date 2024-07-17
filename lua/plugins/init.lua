--- === Setup Lazy ===
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then -- Install Lazy if not installed
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--- === Plugins ===
require("lazy").setup({
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	--- Indent line
	"lukas-reineke/indent-blankline.nvim",
	--- ayu colorscheme
	"Shatur/neovim-ayu",
	--- Autoclose delimiters
	"Raimondi/delimitMate",
	--- Telescope
	require("plugins.telescope"),
	--- LSP Configuration & Plugins
	require("plugins.lsp"),
	--- conform.nvim
	require("plugins.conform"),
	--- nvim-cmp
	require("plugins.nvim-cmp"),
	--- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	--- Treesitter
	require("plugins.treesitter"),
	--- NeoTree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "Show Neo[T]ree" },
			{ "<leader>tg", "<cmd>Neotree git_status toggle<cr>", desc = "Show [G]it status Neo[T]ree" },
		},
	},
	--- Orgmode
	{
		"nvim-orgmode/orgmode",
		dependencies = {

			{
				"lukas-reineke/headlines.nvim",
				dependencies = "nvim-treesitter/nvim-treesitter",
				config = true,
			},
		},
		event = "VeryLazy",
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/org/**/*",
				org_default_notes_file = "~/orgfiles/notes.org",
				mappings = {
					org = {
						org_insert_heading_respect_content = "<leader><CR>",
						org_meta_return = "<prefix>ih",
					},
				},
			})
		end,
	},
	--- alpha.nvim
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local theme = require("alpha.themes.theta")
			theme.header.val = require("banners").random
			alpha.setup(theme.config)
		end,
	},
	--- Neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
		opts = {
			graph_style = "unicode",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
		},
	},
	--- which-key.nvim
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	--- persistence.nvim
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = true,
		keys = {
			{
				"<leader>pp",
				[[<cmd>lua require("persistence").load()<cr>]],
				desc = "Restore session for current directory",
			},
			{
				"<leader>pl",
				[[<cmd>lua require("persistence").load({ last = true })<cr>]],
				desc = "Restore last session",
			},
			{
				"<leader>pd",
				[[<cmd>lua require("persistence").stop()<cr>]],
				desc = "Delete current session",
			},
		},
	},
})
