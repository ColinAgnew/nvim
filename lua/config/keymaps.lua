local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- map("n", "h", "m")
-- map("n", "m", "h")
-- map("n", "j", "n")
-- map("n", "n", "j")
-- map("n", "e", "k")
-- map("n", "k", "e")
-- map("n", "l", "u")
-- map("n", "u", "i")
-- map("n", "i", "l")
-- 
-- map("n", "H", "M")
-- map("n", "M", "H")
-- map("n", "J", "N")
-- map("n", "N", "J")
-- map("n", "E", "K")
-- map("n", "K", "E")
-- map("n", "L", "U")
-- map("n", "U", "I")
-- map("n", "I", "L")
-- 
-- map("v", "h", "m")
-- map("v", "m", "h")
-- map("v", "j", "n")
-- map("v", "n", "j")
-- map("v", "e", "k")
-- map("v", "k", "e")
-- map("v", "l", "i")
-- map("v", "u", "i")
-- map("v", "i", "l")
-- 
-- map("v", "H", "M")
-- map("v", "M", "H")
-- map("v", "J", "N")
-- map("v", "N", "J")
-- map("v", "E", "K")
-- map("v", "K", "E")
-- map("v", "L", "I")
-- map("v", "U", "I")
-- map("v", "I", "L")


-- Keep cursor centered when scrolling
-- map("n", "<C-j>", "<C-d>zz", opts)
map("n", "D", "<C-d>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "J", "<C-d>zz", opts)
-- map("n", "<C-k>", "<C-u>zz", opts)
map("n", "K", "<C-u>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Window Sizing
map("n", "<Leader>z", "<C-w>_<C-w>|", opts, { desc = "Full si[z]e" })
map("n", "<Leader>Z", "<C-w>=", opts, { desc = "Even si[Z]e" })

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
map("n", "<A-l>",":bnext<CR>", opts)
map("n", "<C-[>", ":bprevious<CR>", opts)

-- Panes resizing:b
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
-- map("n", "<CR>", "ciw", opts)
map("n", "<BS>", "ci", opts)

-- map("n", "n", "nzzv", opts)
-- map("n", "N", "Nzzv", opts)
map("n", "*", "*zzv")
map("n", "#", "#zzv")
map("n", "g*", "g*zz")
map("n", "g#", "g#zz")

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>")

-- search modified files
map("n", "<Leader>m", ":Telescope git_status<CR>")

-- Split line with X
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
map("n", "<C-A-a>", "ggVG")

-- write file in current directory
-- :w %:h/<new-file-name>
-- map("n", "<C-n>", ":w %:h/")

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

map("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>')

map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- ctrl + x to cut full line
map("n", "<C-x>", "<C-x>")
map("n", "<C-c>", "<C-a>")

map("n", "d", '"_d')
map("v", "d", '"_d')
map("n", "dd", '"_dd')
map("n", "o", 'o<Esc>')
map("n", "O", 'O<Esc>')



-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})



vim.keymap.set("n", "<leader>sC", function()
  require("telescope").extensions.diff.diff_files({ hidden = true })
end, { desc = "Compare 2 files" })
vim.keymap.set("n", "<leader>sc", function()
  require("telescope").extensions.diff.diff_current({ hidden = true })
end, { desc = "Compare file with current" })

vim.keymap.set('n', 'zK', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)

