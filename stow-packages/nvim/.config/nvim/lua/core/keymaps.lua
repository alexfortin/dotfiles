local map = vim.keymap.set
local opts = { silent = true }

-- Window navigation
map("n", "<C-H>", "<C-W><C-H>", opts)
map("n", "<C-J>", "<C-W><C-J>", opts)
map("n", "<C-K>", "<C-W><C-K>", opts)
map("n", "<C-L>", "<C-W><C-L>", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help tags" })

-- LSP
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>",  { desc = "References" })
map("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- Formatting via conform.nvim
map("n", "<leader>f", function() require("conform").format({ async = true }) end,
  { desc = "Format buffer" })

-- Diagnostics
map("n", "<leader>dd", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

