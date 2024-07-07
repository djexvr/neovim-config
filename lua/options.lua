--- === Options ===

--- Leader Mapping
vim.g.mapleader = " "
vim.g.localleader = " "

--- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

--- Scrolloff
vim.opt.scrolloff = 8

--- Display numbers
vim.opt.number = true
vim.opt.relativenumber = true

--- Show preview on :s
vim.opt.inccommand = "split"

--- Smartcase for search
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- Always show sign column
vim.opt.signcolumn = "yes"

--- Open split on right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

--- Don't show mode, already in status line
vim.opt.showmode = false

--- Enable mouse
vim.opt.mouse = "a"

--- Use system clipboard
vim.opt.clipboard = "unnamedplus"

--- Save undo in file
vim.opt.undofile = true

--- Lower update time
vim.opt.updatetime = 100

--- Neovide
vim.g.neovide_transparency = 0.9
vim.opt.guifont = "FiraCode Nerd Font:h14"

--- Netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\zs\\.\\S\\+"
vim.g.netrw_localcopydircmd = "cp -r"
