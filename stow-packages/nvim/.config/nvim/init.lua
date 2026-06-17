vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"ayu-theme/ayu-vim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.ayucolor = "dark"
			vim.cmd.colorscheme("ayu")
		end,
	},
	{ import = "plugins" },
})
