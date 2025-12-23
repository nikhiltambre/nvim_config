-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--
-- vim.keymap.set('n', '<F5>', function()
--   local file = vim.fn.expand '%'
--   local ext = vim.fn.expand '%:e'
--   local filename = vim.fn.expand '%:t:r'
--   local filepath = vim.fn.expand '%:p:h'
--
--   local input_file = filepath .. '/input.txt'
--   local output_file = filepath .. '/output.txt'
--   local has_input = vim.fn.filereadable(input_file) == 1
--
--   local cmd = nil
--   if ext == 'cpp' then
--     cmd = 'g++ ' .. file .. ' -o ' .. filename .. ' && '
--     if has_input then
--       cmd = cmd .. './' .. filename .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. './' .. filename .. ' > output.txt'
--     end
--   elseif ext == 'c' then
--     cmd = 'gcc ' .. file .. ' -o ' .. filename .. ' && '
--     if has_input then
--       cmd = cmd .. './' .. filename .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. './' .. filename .. ' > output.txt'
--     end
--   elseif ext == 'java' then
--     cmd = 'javac ' .. file .. ' && java ' .. filename
--     if has_input then
--       cmd = cmd .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. ' > output.txt'
--     end
--   elseif ext == 'py' then
--     cmd = 'python3 ' .. file
--     if has_input then
--       cmd = cmd .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. ' > output.txt'
--     end
--   elseif ext == 'js' then
--     cmd = 'node ' .. file
--     if has_input then
--       cmd = cmd .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. ' > output.txt'
--     end
--   elseif ext == 'go' then
--     cmd = 'go run ' .. file
--     if has_input then
--       cmd = cmd .. ' < input.txt > output.txt'
--     else
--       cmd = cmd .. ' > output.txt'
--     end
--   else
--     vim.notify('No run command for .' .. ext .. ' files', vim.log.levels.WARN)
--     return
--   end
--
--   -- Run command directly (no terminal)
--   vim.cmd('!' .. cmd)
--
--   -- Open or refresh output.txt in a split
--   vim.cmd('botright split ' .. output_file)
--   vim.cmd('e ' .. output_file) -- reload contents
-- end, { desc = 'Run file with input/output (no terminal)', noremap = true, silent = true })
--
-- -- F6 for compilation only (unchanged)
-- vim.keymap.set('n', '<F6>', function()
--   local file = vim.fn.expand '%'
--   local ext = vim.fn.expand '%:e'
--   local filename = vim.fn.expand '%:t:r'
--   local filepath = vim.fn.expand '%:p:h'
--
--   local original_dir = vim.fn.getcwd()
--   vim.cmd('cd ' .. filepath)
--
--   if ext == 'cpp' then
--     vim.cmd('!g++ ' .. file .. ' -o ' .. filename)
--   elseif ext == 'c' then
--     vim.cmd('!gcc ' .. file .. ' -o ' .. filename)
--   elseif ext == 'java' then
--     vim.cmd('!javac ' .. file)
--   else
--     vim.notify('No compile command configured for .' .. ext .. ' files', vim.log.levels.WARN)
--   end
--
--   vim.cmd('cd ' .. original_dir)
-- end, { desc = 'Compile current file', noremap = true, silent = false })
--
-- -- Quick shortcuts to create/open input.txt and output.txt
-- vim.keymap.set('n', '<leader>i', function()
--   local filepath = vim.fn.expand '%:p:h'
--   vim.cmd('edit ' .. filepath .. '/input.txt')
-- end, { desc = 'Open/create input.txt', noremap = true, silent = true })
--
-- vim.keymap.set('n', '<leader>o', function()
--   local filepath = vim.fn.expand '%:p:h'
--   vim.cmd('edit ' .. filepath .. '/output.txt')
-- end, { desc = 'Open/create output.txt', noremap = true, silent = true })
--
-- -- F7 to run with input.txt only (without creating output.txt)
-- vim.keymap.set('n', '<F7>', function()
--   local file = vim.fn.expand '%'
--   local ext = vim.fn.expand '%:e'
--   local filename = vim.fn.expand '%:t:r'
--   local filepath = vim.fn.expand '%:p:h'
--
--   local original_dir = vim.fn.getcwd()
--   vim.cmd('cd ' .. filepath)
--
--   local input_file = filepath .. '/input.txt'
--   local has_input = vim.fn.filereadable(input_file) == 1
--
--   if not has_input then
--     vim.notify('input.txt not found in current directory', vim.log.levels.ERROR)
--     vim.cmd('cd ' .. original_dir)
--     return
--   end
--
--   local cmd = ''
--   if ext == 'cpp' then
--     cmd = 'g++ ' .. file .. ' -o ' .. filename .. ' && ./' .. filename .. ' < input.txt'
--   elseif ext == 'c' then
--     cmd = 'gcc ' .. file .. ' -o ' .. filename .. ' && ./' .. filename .. ' < input.txt'
--   elseif ext == 'java' then
--     cmd = 'javac ' .. file .. ' && java ' .. filename .. ' < input.txt'
--   elseif ext == 'py' then
--     cmd = 'python3 ' .. file .. ' < input.txt'
--   elseif ext == 'js' then
--     cmd = 'node ' .. file .. ' < input.txt'
--   elseif ext == 'go' then
--     cmd = 'go run ' .. file .. ' < input.txt'
--   else
--     vim.notify('No run command for .' .. ext .. ' files', vim.log.levels.WARN)
--     vim.cmd('cd ' .. original_dir)
--     return
--   end
--
--   -- Open in terminal buffer (simple approach)
--   vim.cmd 'split'
--   vim.cmd('terminal ' .. cmd)
--   vim.cmd 'startinsert'
--
--   vim.cmd('cd ' .. original_dir)
-- end, { desc = 'Run with input.txt only', noremap = true, silent = false })
--
-- Rest of your existing keymaps remain the same
-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set('n', '<F5>', function()
  local file = vim.fn.expand '%'
  local ext = vim.fn.expand '%:e'
  local filename = vim.fn.expand '%:t:r'
  local filepath = vim.fn.expand '%:p:h'

  local original_dir = vim.fn.getcwd()
  vim.cmd('cd ' .. filepath)

  local cmd = ''
  if ext == 'cpp' then
    cmd = 'g++ ' .. file .. ' -o ' .. filename .. ' && ./' .. filename
  elseif ext == 'c' then
    cmd = 'gcc ' .. file .. ' -o ' .. filename .. ' && ./' .. filename
  elseif ext == 'java' then
    cmd = 'javac ' .. file .. ' && java ' .. filename
  elseif ext == 'py' or ext == 'python' then
    cmd = 'python3 ' .. file
  elseif ext == 'js' then
    cmd = 'node ' .. file
  elseif ext == 'go' then
    cmd = 'go run ' .. file
  else
    vim.notify('No run command configured for .' .. ext .. ' files', vim.log.levels.WARN)
    return
  end

  -- Open in terminal buffer
  vim.cmd 'split'
  vim.cmd('terminal ' .. cmd)
  vim.cmd 'startinsert'

  vim.cmd('cd ' .. original_dir)
end, { desc = 'Run current file in terminal', noremap = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, { desc = 'Format code' })

-- vim.keymap.set('n', '<C-S-i>', function()
--   vim.lsp.buf.format { async = true }
-- end, { desc = 'Format code (Ctrl+Shift+I)' })
--
-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
--vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
