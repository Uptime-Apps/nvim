return {
    'folke/which-key.nvim',
    config = function()
        local wk = require('which-key')
        wk.register({
            ['<leader>'] = {
                d = {vim.diagnostic.setloclist, 'Open diagnostics list'},
                e = {vim.diagnostic.open_float, 'Open floating diagnostic message'},
                s = {
                    name = '+search',
                    f = {require('telescope.builtin').find_files, '[S]earch [F]iles'},
                    h = {require('telescope.builtin').help_tags, '[S]earch [H]elp'},
                    w = {require('telescope.builtin').grep_string, '[S]earch current [W]ord'},
                    g = {require('telescope.builtin').live_grep, '[S]earch by [G]rep'},
                    d = {require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics'}
                },
                y = {'[["+y]]'},
                -- See `:help telescope.builtin
                ['?'] = {require('telescope.builtin').oldfiles, '[?] Find recently opened files', {
                    mode = 'n'
                }}
                -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
                -- vim.keymap.set('n', '<leader>/', function()
                --   -- You can pass additional configuration to telescope to change theme, layout, etc.
                --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                --     winblend = 10,
                --     previewer = false,
                --   })
                -- end, { desc = '[/] Fuzzily search in current buffer' })
            },
            J = {'mzJ`z', 'Join line at cursor'},
            j = {"v:count == 0 ? 'gj' : 'j'", {
                mode = 'n',
                expr = true,
                silent = true
            }},
            k = {"v:count == 0 ? 'gk' : 'k'", {
                mode = 'n',
                expr = true,
                silent = true
            }},
            {
                mode = 'n'
            }
        })
        wk.register({
            ['<Space>'] = {'<Nop>', {
                silent = true,
                mode = {'n', 'v'}
            }}
        })
    end
}
