require("blame").setup {
  date_format = "%Y/%m/%d %H:%M",
  virtual_style = "right_align",
  merge_consecutive = false,
}

vim.api.nvim_set_keymap("n", "<leader>gb", "<CMD>BlameToggle virtual<CR>", { noremap = true, silent = true, desc = "BlameToggle" })
