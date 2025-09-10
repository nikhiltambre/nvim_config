-- return {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--     -- Example config in lua
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = false
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.nord_disable_background = bg_transparent
--       vim.cmd [[colorscheme nord]]
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end
-- }
--

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    transparent_background = false,
    integrations = {
      treesitter = true,
      native_lsp = { enabled = true },
      cmp = true,
      gitsigns = true,
      telescope = true,
      nvimtree = true,
      bufferline = true,
      lualine = true,
    },
  },
  config = function(_, opts)
    local catppuccin = require 'catppuccin'
    catppuccin.setup(opts)

    -- default colorscheme
    vim.cmd.colorscheme 'catppuccin'

    -- toggle transparency
    local transparent = true
    local toggle_transparency = function()
      transparent = not transparent
      catppuccin.setup(vim.tbl_extend('force', opts, {
        transparent_background = transparent,
      }))
      vim.cmd.colorscheme 'catppuccin'
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
