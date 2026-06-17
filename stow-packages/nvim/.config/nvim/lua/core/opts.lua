local o = vim.opt
o.termguicolors  = true
o.background     = "dark"

-- Editing
o.autoindent     = true
o.tabstop        = 4
o.shiftwidth     = 4
o.expandtab      = true
o.backspace      = "indent,eol,start"

-- Search
o.ignorecase     = true
o.smartcase      = true

-- Splits + timeouts
o.splitbelow     = true
o.splitright     = true
o.timeoutlen     = 1000
o.ttimeoutlen    = 0

-- Clipboard (macOS-friendly)
o.clipboard      = "unnamedplus"
vim.opt.clipboard = "unnamedplus"

-- Optional: fzf runtimepath for Intel & Apple Silicon Homebrew
local fzf_paths = { "/usr/local/opt/fzf", "/opt/homebrew/opt/fzf" }
for _, p in ipairs(fzf_paths) do
  if vim.fn.isdirectory(p) == 1 then
    o.rtp:append(p)
  end
end
