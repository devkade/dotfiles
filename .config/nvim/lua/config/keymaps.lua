-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey("<leader>n", ":Neotree toggle<cr>")

-- clear search hl
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- Select all
mapKey("<C-a>", "gg<S-v>G")

-- New tab
mapKey("te", ":tabedit<Return>")
mapKey("<tab>", ":tabnext<Return>")
mapKey("<S-tab>", ":tabprevious<Return>")

-- Split Window
mapKey("ss", ":split<Return>")
mapKey("sv", ":vsplit<Return>")

-- Pane navigation
mapKey("sh", "<C-w>h") -- Left
mapKey("sj", "<C-w>j") -- Down
mapKey("sk", "<C-w>k") -- Up
mapKey("sl", "<C-w>l") -- Right

-- Resize Window
mapKey("<C-w><left>", "<C-w><")
mapKey("<C-w><right>", "<C-w>>")
mapKey("<C-w><up>", "<C-w>+")
mapKey("<C-w><down>", "<C-w>-")

-- Diagnostics
mapKey("<C-j>", function()
  vim.diagnostic.goto_next()
end)

-- Lazy
mapKey("<leader>l", ":Lazy<cr>")
