vim.g.haskell_tools = {
  tools = {
    log = {
      level = vim.log.levels.ERROR,
    },
  },
  hls = {
    on_attach = require("helpers.lsp").on_attach,
    settings = {
      haskell = {},
    },
  },
}
