-- lua/plugins/lang_servers.lua
return {
  -- Add Mason LSPs for your remaining languages
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- LSP for LaTeX
        texlab = {},
        -- LSP for YAML (already partially covered by a LazyVim extra, but good to ensure)
        yamlls = {},
      },
    },
  },
}
