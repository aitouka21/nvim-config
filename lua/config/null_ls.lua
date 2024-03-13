local null_ls = require("null-ls")
local cspell = require("cspell")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.sql_formatter,
    cspell.diagnostics.with {
      diagnostics_postprocess = function(diagnostic) diagnostic.severity = vim.diagnostic.severity.HINT end,
    },
    cspell.code_actions,
  },
}
