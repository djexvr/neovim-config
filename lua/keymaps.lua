--- === Mapping ===
local opts = { noremap = true, silent = true }

--- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

--- Azerty convenience
vim.keymap.set("n", "ç", "^", opts)

--- Escape tweak
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("i", "kj", "<Esc>", opts)

--- Nohl on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
