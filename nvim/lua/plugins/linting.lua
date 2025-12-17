-- lua/plugins/linting.lua
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- This MUST be 'null-ls' even if the repo is 'none-ls.nvim'
    local nls = require("null-ls")
    local builtins = nls.builtins
    
    -- 1. FORMATTING: Access through the 'formatting' sub-table
    table.insert(opts.sources, builtins.formatting.ruff.with({
      args = { "format", "-" },
      filetypes = { "python" },
    }))

    -- 2. LINTING/FIXING: Access through the 'diagnostics' sub-table
    table.insert(opts.sources, builtins.diagnostics.ruff.with({
      args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
      to_stdin = true,
      filetypes = { "python" },
      methods = {
        nls.methods.CODE_ACTION,
      },
    }))

    return opts
  end,
}
