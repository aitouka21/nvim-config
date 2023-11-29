require("harpoon").setup {}

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hm", mark.add_file, { desc = "Add [M]ark" })
vim.keymap.set("n", "<leader>hf", ui.toggle_quick_menu, { desc = "Toggle [F]ile Menu" })
vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "Go to [N]ext Mark" })
vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "Go to [P]revious Mark" })
