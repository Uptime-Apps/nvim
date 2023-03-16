local I = require('custom.theme._icons')
return {
    'lewis6991/gitsigns.nvim',
    opts = {
        count_chars = {
            [1] = '₁',
            [2] = '₂',
            [3] = '₃',
            [4] = '₄',
            [5] = '₅',
            [6] = '₆',
            [7] = '₇',
            [8] = '₈',
            [9] = '₉',
            ['+'] = '₊'
        },
        current_line_blame = false,
        diff_opts = {
            internal = true,
            algorithm = 'minimal'
        },
        numhl = true,
        sign_priority = 6,
        status_formatter = nil, -- Use default
        update_debounce = 100,
        watch_gitdir = {
            enable = true,
            interval = 1000,
            follow_files = true
        },
        on_attach = function(bufnr)
            local wk = require('which-key')
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                if opts.desc then
                    opts.desc = 'GitSigns: ' .. opts.desc
                else
                    opts.desc = 'GitSigns: NOT DOCUMENTED'
                end
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, {
                expr = true,
                desc = 'Next [C]hunk'
            })

            map('n', '[c', function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, {
                expr = true,
                desc = 'Prev [C]hunk'
            })

            -- Actions
            wk.register({
                ['ih'] = {':<C-U>Gitsigns select_hunk<CR>', 'Select Hunk', {
                    mode = {'o', 'x'},
                    noremap = true,
                    buffer = true
                }}
            })
            wk.register({
                ['<leader>h'] = {
                    name = '+history',
                    s = {':Gitsigns stage_hunk<CR>', 'GitSigns: [H]unk [S]tage'},
                    r = {':Gitsigns reset_hunk<CR>', 'GitSigns: [H]unk [R]eset'}
                }
            }, {
                mode = 'v'
            })
            wk.register({
                ['<leader>h'] = {
                    name = '+history',
                    h = {':Git<CR>', 'Fugitive: Git', {
                        silent = true
                    }},
                    a = {':Git add %<CR>', 'Fugitive: Git Add File', {
                        silent = true
                    }},
                    m = {':Git maergetool %<CR>', 'Fugitive: Git Mergetool', {
                        silent = true
                    }},
                    s = {':Gitsigns stage_hunk<CR>', 'GitSigns: [H]unk [S]tage'},
                    r = {':Gitsigns reset_hunk<CR>', 'GitSigns: [H]unk [R]eset'},
                    S = {gs.stage_buffer, 'GitSigns: [S]tage Buffer'},
                    u = {gs.undo_stage_hunk, 'GitSigns: [U]ndo Stage Hunk'},
                    R = {gs.reset_buffer, 'GitSigns: [R]eset Buffer'},
                    p = {gs.preview_hunk, 'GitSigns: [H]unk [P]review'},
                    b = {function()
                        gs.blame_line {
                            full = true
                        }
                    end, 'GitSigns: [B]lame'},
                    d = {gs.diffthis, 'GitSigns: [D]iff This'},
                    D = {function()
                        gs.diffthis('~')
                    end, 'GitSigns: [D]iff this ~'}
                },
                ['<leader>ht'] = {
                    name = '+toggle',
                    b = {gs.toggle_current_line_blame, 'GitSigns: [T]oggle Current Line [B]lame'},
                    d = {gs.toggle_deleted, 'GitSigns: [T]oggle [D]eleted'}
                }
            }, {
                mode = 'n'
            })
        end,
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = I.pipe,
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn'
            },
            change = {
                hl = 'GitSignsChange',
                text = I.pipe,
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            },
            delete = {
                hl = 'GitSignsDelete',
                text = I.pipe,
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
                show_count = true
            },
            topdelete = {
                hl = 'GitSignsTopdelete',
                text = I.pipe,
                numhl = 'GitSignsTopdeleteNr',
                linehl = 'GitSignsTopdeleteLn'
            },
            changedelete = {
                hl = 'GitSignsChangedelete',
                text = I.pipe,
                numhl = 'GitSignsChangedeleteNr',
                linehl = 'GitSignsChangedeleteLn'
            },
            untracked = {
                hl = 'GitSignsUntracked',
                text = I.pipe,
                numhl = 'GitSignsUntrackedNr',
                linehl = 'GitSignsUntrackedLn'
            }
        }
    }
}
