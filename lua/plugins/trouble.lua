return{
  "folke/trouble.nvim",
  cond = not vim.g.vscode,
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      desc = "Diagnostics (Trouble)",
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
    },
    {
      desc = "Buffer Diagnostics (Trouble)",
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    },
    {
      desc = "Symbols (Trouble)",
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
    },
    {
      desc = "LSP Definitions / references / ... (Trouble)",
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    },
    {
      desc = "Location List (Trouble)",
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
    },
    {
      desc = "Quickfix List (Trouble)",
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
    },
  },
}
