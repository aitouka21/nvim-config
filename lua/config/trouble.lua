local trouble = require("trouble")

trouble.setup {
  position = "bottom",
  height = 20,
  icons = true,
}

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xw", function() trouble.open("workspace_diagnostics") end, { desc = "Open [W]orkspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", function() trouble.open("document_diagnostics") end, { desc = "Open [D]ocument Diagnostics" })
vim.keymap.set("n", "<leader>xq", function() trouble.open("quickfix") end, { desc = "Open [Q]uickfix" })
vim.keymap.set("n", "<leader>xl", function() trouble.open("loclist") end, { desc = "Open [L]ocation List" })
vim.keymap.set("n", "gR", function() trouble.open("lsp_references") end, { desc = "Open Lsp [R]eferences" })
