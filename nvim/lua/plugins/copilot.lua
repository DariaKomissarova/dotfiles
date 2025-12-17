-- lua/plugins/copilot.lua
return {
  "github/copilot.vim",
  lazy = false, -- Needs to load at startup
  config = function()
    vim.g.copilot_no_tab_map = true -- Disable default <Tab> mapping
    vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
--  vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#accept("\\<CR>")', { silent = true, expr = true, noremap = true })
-- Change the mapping from <C-k> to something less likely to conflict, like <C-g>
--vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#accept("\\<CR>")', { silent = true, expr = true, noremap = true })

  end,
}
