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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    local bopts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set("n", "d", "d", bopts)
    vim.keymap.set("v", "d", "d", bopts)
    vim.keymap.set("n", "dd", "dd", bopts)
    vim.keymap.set("n", "<BS>", "<BS>", bopts)
  end,
})



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

if not vim.g.vscode then
  vim.keymap.set('n', 'zK', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
          vim.fn.CocActionAsync('definitionHover') -- coc.nvim
          vim.lsp.buf.hover()
      end
  end)
end

-- VS Code specific keymaps (replaces Telescope/Neo-tree/etc.)
if vim.g.vscode then
  local vsc = require('vscode')

  -- File finding (replaces Telescope)
  map("n", "<leader>f", function() vsc.action("workbench.action.quickOpen") end)
  map("n", "<leader>sf", function() vsc.action("workbench.action.quickOpen") end)
  map("n", "<leader>st", function() vsc.action("workbench.action.findInFiles") end)
  map("n", "<leader>sT", function() vsc.action("workbench.action.findInFiles") end)
  map("n", "<leader>sl", function() vsc.action("workbench.action.quickOpen") end)
  map("n", "<leader>so", function() vsc.action("workbench.action.openRecent") end)
  map("n", "<leader>o", function() vsc.action("workbench.action.showAllEditors") end)

  -- File explorer (replaces Neo-tree)
  map("n", "<leader>e", function() vsc.action("workbench.action.toggleSidebarVisibility") end)
  map("n", "<leader><tab>", function() vsc.action("workbench.view.explorer") end)

  -- Buffer/editor navigation
  map("n", "<A-l>", function() vsc.action("workbench.action.nextEditor") end)
  map("n", "<C-[>", function() vsc.action("workbench.action.previousEditor") end)
  map("n", "Q", function() vsc.action("workbench.action.closeActiveEditor") end)

  -- Save/quit
  map("n", "<leader>w", function() vsc.action("workbench.action.files.save") end)
  map("n", "<leader>W", function() vsc.action("workbench.action.files.saveWithoutFormatting") end)
  map("n", "<leader>q", function() vsc.action("workbench.action.closeActiveEditor") end)

  -- LSP actions (replaces <leader>l*)
  map("n", "<leader>la", function() vsc.action("editor.action.quickFix") end)
  map("n", "<leader>lf", function() vsc.action("editor.action.formatDocument") end)
  map("n", "<leader>lr", function() vsc.action("editor.action.rename") end)
  map("n", "<leader>lw", function() vsc.action("workbench.panel.markers.view.focus") end)
  map("n", "<leader>li", function() vsc.action("editor.action.goToImplementation") end)
  map("n", "<leader>ls", function() vsc.action("editor.action.triggerParameterHints") end)
  map("n", "<leader>v", function() vsc.action("editor.action.revealDefinitionAside") end)

  -- LSP navigation (replaces Telescope LSP pickers)
  map("n", "gd", function() vsc.action("editor.action.revealDefinition") end)
  map("n", "gr", function() vsc.action("editor.action.goToReferences") end)
  map("n", "gi", function() vsc.action("editor.action.goToImplementation") end)
  map("n", "go", function() vsc.action("editor.action.goToTypeDefinition") end)
  map("n", "gl", function() vsc.action("editor.action.showHover") end)
  map("n", "gD", function() vsc.action("editor.action.revealDeclaration") end)
  map("n", "gs", function() vsc.action("editor.action.triggerParameterHints") end)

  -- Git (replaces lazygit/gitsigns UI)
  map("n", "<leader>lg", function() vsc.action("workbench.view.scm") end)
  map("n", "<leader>hb", function() vsc.action("git.checkout") end)
  map("n", "<leader>hl", function() vsc.action("gitlens.toggleLineBlame") end)
  map("n", "<leader>hd", function() vsc.action("editor.action.dirtydiff.next") end)
  map("n", "<leader>ho", function() vsc.action("workbench.view.scm") end)
  map("n", "<leader>m", function() vsc.action("workbench.view.scm") end)

  -- Terminal (replaces toggleterm)
  map("n", "<C-t>", function() vsc.action("workbench.action.terminal.toggleTerminal") end)

  -- Diagnostics (replaces Trouble)
  map("n", "<leader>xx", function() vsc.action("workbench.panel.markers.view.focus") end)
  map("n", "<leader>xX", function() vsc.action("workbench.panel.markers.view.focus") end)

  -- Search/replace (replaces Spectre)
  map("n", "<leader>rr", function() vsc.action("workbench.action.findInFiles") end)
  map("n", "<leader>rf", function() vsc.action("editor.action.startFindReplaceAction") end)
  map("n", "<leader>rw", function() vsc.action("editor.action.startFindReplaceAction") end)

  -- Symbols (replaces Telescope symbol pickers)
  map("n", "<leader>p", function() vsc.action("workbench.action.gotoSymbol") end)
  map("n", "<leader>P", function() vsc.action("workbench.action.showAllSymbols") end)

  -- Tests (replaces neotest)
  map("n", "<leader>tr", function() vsc.action("testing.runAtCursor") end)
  map("n", "<leader>tt", function() vsc.action("testing.runCurrentFile") end)
  map("n", "<leader>tT", function() vsc.action("testing.runAll") end)
  map("n", "<leader>ts", function() vsc.action("workbench.view.testing.focus") end)

  -- Copilot chat
  map("n", "<leader>c", function() vsc.action("workbench.panel.chat.view.copilot.focus") end)
end

local function navigate(dir)
  return function()
    local key = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
    vim.api.nvim_feedkeys(key, "n", true)
    vim.schedule(function()
      vim.cmd("TmuxNavigate" .. dir)
    end)
  end
end

vim.api.nvim_create_autocmd({ "TermEnter", "BufEnter" }, {
  pattern = "term://*",
  callback = function()
    local name = vim.fn.bufname('%')
    if name:match("claude") then
      vim.schedule(function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set("t", "<C-h>", navigate("Left"),  opts)
        vim.keymap.set("t", "<C-j>", navigate("Down"),  opts)
        vim.keymap.set("t", "<C-k>", navigate("Up"),    opts)
        vim.keymap.set("t", "<C-l>", navigate("Right"), opts)
      end)
    end
  end,
})
