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
--
-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = 'mocha', -- latte, frappe, macchiato, mocha
--     transparent_background = false,
--     integrations = {
--       treesitter = true,
--       native_lsp = { enabled = true },
--       cmp = true,
--       gitsigns = true,
--       telescope = true,
--       nvimtree = true,
--       bufferline = true,
--       lualine = true,
--     },
--   },
--   config = function(_, opts)
--     local catppuccin = require 'catppuccin'
--     catppuccin.setup(opts)
--
--     -- default colorscheme
--     vim.cmd.colorscheme 'catppuccin'
--
--     -- toggle transparency
--     local transparent = true
--     local toggle_transparency = function()
--       transparent = not transparent
--       catppuccin.setup(vim.tbl_extend('force', opts, {
--         transparent_background = transparent,
--       }))
--       vim.cmd.colorscheme 'catppuccin'
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }
--
-- -- Monokai theme:
-- return {
--   'tanvirtin/monokai.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local monokai = require 'monokai'
--     local palette = monokai.pro -- options: monokai.pro / monokai.soda / monokai.ristretto
--
--     monokai.setup {
--       palette = palette,
--       italics = false,
--       custom_hlgroups = {},
--     }
--
--     -- Load the colorscheme
--     vim.cmd [[colorscheme monokai]]
--
--     -- Toggle background transparency
--     local transparent = false
--     local toggle_transparency = function()
--       transparent = not transparent
--       if transparent then
--         vim.cmd [[highlight Normal guibg=none]]
--         vim.cmd [[highlight NonText guibg=none]]
--         vim.cmd [[highlight NormalNC guibg=none]]
--         vim.cmd [[highlight SignColumn guibg=none]]
--         vim.cmd [[highlight EndOfBuffer guibg=none]]
--       else
--         vim.cmd [[colorscheme monokai]]
--       end
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }
return {
  'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local vscode = require 'vscode'

    vscode.setup {
      transparent = false,
      italic_comments = false,
    }
    vscode.load() -- default dark

    --------------------------------------------------------------
    -- LIGHT / DARK TOGGLE  (fixed!)
    --------------------------------------------------------------
    local is_light = false

    local function toggle_theme()
      is_light = not is_light

      if is_light then
        vim.o.background = 'light' -- IMPORTANT FIX
        vscode.load 'light'
      else
        vim.o.background = 'dark' -- IMPORTANT FIX
        vscode.load()
      end
    end

    vim.keymap.set('n', '<leader>cl', toggle_theme, {
      noremap = true,
      silent = true,
    })

    --------------------------------------------------------------
    -- TRANSPARENCY TOGGLE (works)
    --------------------------------------------------------------
    local transparent = false
    local function toggle_transparency()
      transparent = not transparent

      if transparent then
        vim.cmd 'hi Normal guibg=none'
        vim.cmd 'hi NormalNC guibg=none'
        vim.cmd 'hi SignColumn guibg=none'
        vim.cmd 'hi EndOfBuffer guibg=none'
        vim.cmd 'hi NonText guibg=none'
      else
        -- reload theme depending on current mode
        if is_light then
          vim.o.background = 'light'
          vscode.load 'light'
        else
          vim.o.background = 'dark'
          vscode.load()
        end
      end
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, {
      noremap = true,
      silent = true,
    })
  end,
}
