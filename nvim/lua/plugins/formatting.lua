-- lua/plugins/formatting.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- This runs Ruff "Fix" (linting) followed by Ruff "Format"
      python = { "ruff_fix", "ruff_format" },
    },
  },
}
