-- hop
local hop = require("hop")

hop.setup {}

vim.keymap.set("n", "<leader>fw", hop.hint_words)
