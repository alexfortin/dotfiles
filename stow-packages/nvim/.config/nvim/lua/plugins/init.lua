return {
  {
    "ayu-theme/ayu-vim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.ayucolor = "dark"
      vim.cmd.colorscheme("ayu")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({ options = { theme = "ayu" } })
    end,
  },
}

