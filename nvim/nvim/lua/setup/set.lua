--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------
vim.opt.guicursor = ""

-- Display the cursor position on the last line of the screen or in the status
-- line of a window
vim.opt.ruler = true

-- Set splitting behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Give me line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Move content when cursor is 7 lines while vertically scrolling
vim.opt.scrolloff=7

-- Use the same symbols as TextMate for tabstops and EOLs
vim.opt.listchars = {
        tab = "▸ ",
        eol = "¬",
}

vim.opt.list = true

--------------------------------------------------------------------------------
-- Text, tab and indent related
--------------------------------------------------------------------------------
-- Indentation settings according to personal preference.

-- Indentation settings for using 4 spaces instead of tabs.
-- Do not change 'tabstop' from its default value of 8 with this setup.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Be smart when using tabs
vim.opt.smarttab = true

-- Auto indent
vim.opt.autoindent = true

-- Smart indent
vim.opt.smartindent = true

-- Wrap lines
vim.opt.wrap = true

--------------------------------------------------------------------------------
-- Undo
--------------------------------------------------------------------------------
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


--------------------------------------------------------------------------------
-- Behaviour
--------------------------------------------------------------------------------
-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Make search act like search in modern browsers
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
