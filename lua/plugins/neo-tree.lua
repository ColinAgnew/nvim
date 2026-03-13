-- TODO

-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>e",
            function()
            --     local reveal_file = vim.fn.expand("%:p")
            --     if reveal_file == "" then
            --         reveal_file = vim.fn.getcwd()
            --     else
            --         local f = io.open(reveal_file, "r")
            --         if f then
            --             f.close(f)
            --         else
            --             reveal_file = vim.fn.getcwd()
            --         end
            --     end
                if vim.g.neovide then
                    require("neo-tree.command").execute({
                        toggle = true, -- OPTIONAL, this is the default value
                        action = "focus", -- OPTIONAL, this is the default value
                        source = "filesystem", -- OPTIONAL, this is the default value
                        position = "float", -- OPTIONAL, this is the default value
                        dir = ".",
                        -- reveal_file = reveal_file, -- path to file or folder to reveal
                        reveal_force_cwd = true, -- change cwd without asking if needed
                })
                else
                    require("neo-tree.command").execute({
                        toggle = true, -- OPTIONAL, this is the default value
                        action = "focus", -- OPTIONAL, this is the default value
                        source = "filesystem", -- OPTIONAL, this is the default value
                        position = "float", -- OPTIONAL, this is the default value
                        -- reveal_file = reveal_file, -- path to file or folder to reveal
                        reveal_force_cwd = true, -- change cwd without asking if needed
                })
                end
            end,
            desc = "Float File Explorer",
        },
        --{ "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
        { "<leader><tab>", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "single",
            enable_git_status = true,
            enable_modified_markers = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            default_component_configs = {
                indent = {
                    with_markers = true,
                    with_expanders = true,
                },
                modified = {
                    symbol = " ",
                    highlight = "NeoTreeModified",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "float",
                width = 35,
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
                window = {
                    mappings = {
                        ["L"] = "open_nofocus",
                        ["<C-h>"] = "toggle_hidden",

                    },
                },
                commands = {
                    open_nofocus = function(state)
                        require("neo-tree.sources.filesystem.commands").open(state)
                        vim.schedule(function()
                            vim.cmd([[Neotree focus]])
                        end)
                    end,
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
            },
        })
    end,
}
