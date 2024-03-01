-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    layout_strategy = "vertical",
    find_command = {
      "rg",
      "--files",
      "--hidden",
      "--smart-case",
      "--glob",
      "!.git",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
      n = {
        ["<M-q>"] = false,
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]iles" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[Find] [H]elp Tags" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { noremap = true, silent = true, desc = "[F]ind [R]eferences" })
