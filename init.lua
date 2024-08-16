require("isuck.set")
require("isuck.mappings")
require("plugins")

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
-- TODO: why config is not working inside nvim-lspconfig?
-- maybe due to mason?
require("config.lsp")
