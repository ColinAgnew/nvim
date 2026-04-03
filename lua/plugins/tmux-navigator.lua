return {
  "christoomey/vim-tmux-navigator",
  cond = not vim.g.vscode,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  mode = { "n" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  mode = { "n" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    mode = { "n" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n" } },
  },
}
