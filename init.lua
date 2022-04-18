vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.pumheight = 10

vim.opt.scrolloff = 3

vim.cmd('syntax on')

-- Display numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hidden = true -- Hide buffer on windows close

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.laststatus = 2 -- Status bar always showing

vim.opt.mouse = 'a'

vim.opt.clipboard = 'unnamedplus'

vim.opt.guifont = 'DejaVu Sans Mono:h12'

-- === Colorscheme ===
vim.opt.termguicolors = true
vim.g.tokyonight_style = 'night' -- available: night, storm
vim.g.tokyonight_enable_italic = 1
vim.cmd('colorscheme ayu-mirage')

-- === Mapping ===
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}
vim.g.mapleader = " "

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('i', 'jk', '<Esc>', opts)
map('i', 'kj', '<Esc>', opts)

map('n', 'è', '`', opts)

map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

--- === AutoCommands ===
function cd_to_git_root()
    if (not pcall(vim.cmd, 'Gcd')) then vim.cmd('cd %:h') end
end

vim.cmd('autocmd BufEnter ?* lua cd_to_git_root()')

--- === Packer ===
local packer = require('packer')
packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'karb94/neoscroll.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'Raimondi/delimitMate'
    use 'lifepillar/vim-gruvbox8'
    use 'Shatur/neovim-ayu'
    -- Allow manipulation of surrounding delimiter
    use 'machakann/vim-sandwich'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    -- Color matching brackets
    use "p00f/nvim-ts-rainbow"
    -- Better python folding
    use 'eddiebergman/nvim-treesitter-pyfold'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
end)

--- === Plugin Configuration ===

--- Neoscroll
require('neoscroll').setup()

--- Treesitter

require('nvim-treesitter.configs').setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
}
-- vim.cmd("set foldmethod=expr")
-- vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

--- Telescope
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
