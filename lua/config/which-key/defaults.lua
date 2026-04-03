return {
    { "<leader>;", ":Alpha<cr>", desc = "dashboard" },
    { "<leader>c", ":CopilotChat<cr>", desc = "Copilot" },

    { "<leader>w", ":w!<CR>", desc = "Save" },

    { "<leader>q", ":confirm q<CR>", desc = "Quit" },

    { "<leader>z", "<C-w>_<C-w>|", desc = "Full si[z]e" },
    { "<leader>Z", "<C-w>=", desc = "Even si[Z]e" },

  -- h = { ":nohlsearch<CR>", "No Highlight" },
  -- p = { require("telescope.builtin").lsp_document_symbols, "Document Symbols" },
  -- P = { require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols" },
    { "<leader>f", require("config.utils").telescope_git_or_file, desc = "Find Files (Root)" },

    { "<leader>v", desc = "Go to definition in a split" },

    { "<leader>a",  desc = "AI/Claude Code" },
    { "<leader>ac",  desc = "Toggle Claude" },
    { "<leader>af",  desc = "Focus Claude" },
    { "<leader>ar",  desc = "Resume Claude" },
    { "<leader>aC",  desc = "Continue Claude" },
    { "<leader>am",  desc = "Select Claude model" },
    { "<leader>ab",  desc = "Add current buffer" },
    { "<leader>as",  desc = "Send to Claude" },
    { "<leader>as", desc = "Add file" },
    -- Diff management
    { "<leader>aa",  desc = "Accept diff" },
    { "<leader>ad",  desc = "Deny diff" },

    { "<leader>o",
      function ()
        require("telescope.builtin").buffers({ sort_lastused = true, ignore_current_buffer = false })
     end,
      desc = "Open Buffer"},
    { "<leader>W", "<cmd>noautocmd w<cr>", desc = "Save without formatting (noautocmd)" },

    { "<leader>u", desc = "UI" },
    { "<leader>uc", require("config.utils").toggle_cursor_column, desc = "Toggle Cursor Column" },
    { "<leader>uv", require("config.utils").toggle_cursor_line, desc = "Toggle Cursor Line" },

    { "<leader>i", desc = "Sessions" },
    { "<leader>is", "<cmd>lua require('persistence').load()<cr>", desc = "Load Session" },
    { "<leader>id", "<cmd>lua require('persistence').stop()<cr>", desc = "Stop Persistence" },
    { "<leader>il", "<cmd>lua require('persistence').load({ last = true })<cr>", desc = "Load Last Session" },

    { "<leader>r", desc = "Replace (Spectre)" },
    { "<leader>rf", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Replace Buffer" },
    { "<leader>rr", "<cmd>lua require('spectre').open()<cr>", desc = "Replace" },
    { "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Replace Word" },

    { "<leader>h", desc = "+Git" },
    { "<leader>hC", require("telescope.builtin").git_bcommits, desc = "Checkout commit(for current file)" },
    { "<leader>hR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>hU", ":UndotreeToggle<CR>", desc = "Toggle UndoTree" },
    { "<leader>hb", require("telescope.builtin").git_branches, desc = "Checkout branch" },
    { "<leader>hc", require("telescope.builtin").git_commits, desc = "Checkout commit" },
    { "<leader>hd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
    { "<leader>hj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>hk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>hl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>ho", require("telescope.builtin").git_status, desc = "Open changed file" },
    { "<leader>hp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>hr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>hs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>hS", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", desc = "Stage Buffer" },
    { "<leader>hu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },

    { "<leader>l", desc = "+LSP" },
    { "<leader>lA", vim.lsp.buf.range_code_action, desc = "Range Code Actions" },
    { "<leader>lW", desc = "+Workspace" },
    { "<leader>lWa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder" },
    { "<leader>lWl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
     desc = "List Folders" },
    { "<leader>lWr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
    { "<leader>la", vim.lsp.buf.code_action,  desc = "Code Action" },
    { "<leader>lc", require("config.utils").copyFilePathAndLineNumber, desc = "Copy File Path and Line Number" },
    { "<leader>lf", vim.lsp.buf.format, desc = "Format" },
    { "<leader>li", require("telescope.builtin").lsp_implementations, desc = "Implementation" },
    { "<leader>lr", vim.lsp.buf.rename, desc = "Rename all references" },
    { "<leader>ls", vim.lsp.buf.signature_help, desc = "Display Signature Information" },
    { "<leader>lw", require("telescope.builtin").diagnostics, desc = "Diagnostics" },

    { "<leader>m", desc = "+Markview" },
    { "<leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Toggle split-view preview"},

    { "<leader>M", "<cmd>Markview Toggle<cr>", desc = "Toggle preview for the current buffer"},
{ "<leader>s", desc = "+Search" },
    { "<leader>sB", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sN", function ()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end, desc = "Search Neovim Config" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
    { "<leader>sT", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>sd", desc = "+DAP" },
    { "<leader>sdb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Dap Breakpoints" },
    { "<leader>sdc", "<cmd>Telescope dap commands<cr>", desc = "Dap Commands" },
    { "<leader>sdf", "<cmd>Telescope dap frames<cr>", desc = "Dap Frames" },
    { "<leader>sdg", "<cmd>Telescope dap configurations<cr>", desc = "Dap Configurations" },
    { "<leader>sdv", "<cmd>Telescope dap variables<cr>", desc = "Dap Variables" },
    { "<leader>se", "<cmd>Telescope frecency<cr>", desc = "Frecency" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File (CWD)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    { "<leader>sm", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

    { "<leader>T", desc = "+Todo" },
    { "<leader>Tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>TT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>Tx", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>TX",  "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>", desc = "Todo/Fix/Fixme (Trouble)" },

    { "<leader>d", desc = "Debug" },
    { "<leader>dO", require("dap").step_out, desc = "Out" },
    { "<leader>db", require("dap").toggle_breakpoint, desc = "Breakpoint" },
    { "<leader>dc", require("dap").continue, desc = "Continue" },
    { "<leader>di", require("dap").step_into, desc = "Into" },
    { "<leader>dl", require("dap").run_last, desc = "Last" },
    { "<leader>do", require("dap").step_over, desc = "Over" },
    { "<leader>dr", require("dap").repl.toggle, desc = "Repl" },
    { "<leader>du", require("dapui").toggle, desc = "UI" },
    { "<leader>dx", require("dap").terminate, desc = "Exit" },

    { "<leader>n", desc = "+Neorg" },
    { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Go to Neorg Index" },
    { "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Go to Neorg Journal" },

    { "<leader>t", desc = "+Tests" },

    { "<leader>x", desc = "+Trouble" },

}
