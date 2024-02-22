-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remove some keymappings
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({'n','v'}, '<C-S-j>', '<Nop>', {silent=true})
vim.keymap.set({'n','v'}, '<C-S-k>', '<Nop>', {silent=true})
--- Remove the f1 mapping to vim docs, because I keep pressing it accidentally.
vim.keymap.set({ 'n', 'v' }, '<F1>', '<Nop>', {silent = true})
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Maps a shortcut for moving between windows
vim.keymap.set('n', '<C-h>', '<C-w>h',{silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j',{silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k',{silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l',{silent = true})
vim.keymap.set('n', '<C-x>', '<C-w>x',{silent = true})

--Create a command for changing the colorcolumn propriety
local colorcolumn_states = {'120','80'}
local current_state = 1
local colorcolumn_switch_fn = function(opts)
    local l = #colorcolumn_states
    current_state = current_state + 1
    if(current_state > l) then
    	current_state = 1
    end
    vim.cmd.echo(string.format("'colorcolumn = %d'", colorcolumn_states[current_state]))
    vim.o.colorcolumn = colorcolumn_states[current_state]
end
vim.api.nvim_create_user_command("ColorColumnSwitch", colorcolumn_switch_fn, {})

--Remaos netrw call
vim.keymap.set('n','<leader>pv',vim.cmd.Ex, {desc = 'Explore files'})

-- Telescope configuration
local function dropdown_blt_menu(blt_function)
    return function()
	require('telescope.builtin')[blt_function](require('telescope.themes').get_dropdown {
	    winblend = 45,
	    previewer = false,
	    layout_config = {
		height = 25
	    }
	})
    end
end
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/',  dropdown_blt_menu('current_buffer_fuzzy_find'),
    { desc = '[/] Fuzzily search in current buffer' })
--Shortcuts for managing buffers
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').live_grep,  { desc = '[S]earch [S]tring' })
vim.keymap.set('n', '<leader>gf', dropdown_blt_menu('git_files'), { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', dropdown_blt_menu('find_files'), { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
--
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
