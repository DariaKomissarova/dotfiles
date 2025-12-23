return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- Add this for ruff support
  },
  opts = function(_, opts)
    local nls = require("null-ls")
    
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- Use the extra ruff source for diagnostics
      require("none-ls.diagnostics.ruff"),
      
      -- Use the extra ruff source for formatting
      require("none-ls.formatting.ruff"),
      
      -- Add standard builtins that are still in the core
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
    })
  end,
}
