require("isuck.set")
require("isuck.mappings")
require("plugins")

local transparent_highlights = {
  "Normal",
  "NormalNC",
  "LineNr",
  "Folded",
  "NonText",
  "SpecialKey",
  "VertSplit",
  "SignColumn",
  "EndOfBuffer",
  "TablineFill", -- this might be preference
}

for _, hl in ipairs(transparent_highlights) do
  vim.cmd.highlight(hl .. " guibg=NONE ctermbg=NONE")
end

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
