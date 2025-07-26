-- space for leader key
vim.g.mapleader=" "

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Testing for  lua
--vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.config({ virtual_text = true, signs = true, update_in_insert = false, underline = true, severity_sort = false, float = true })<CR>")

