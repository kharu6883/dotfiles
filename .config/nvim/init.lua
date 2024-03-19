-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- space as mapleader
vim.g.mapleader = " "

-- mapleader keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)

vim.keymap.set("n", "<leader>tp", vim.cmd.tabp)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)

-- tab settings
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.numberwidth=5

-- timeout
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 5

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- lazy package manager
require("lazy").setup("plugins")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep >") })
end)

-- lualine
require("lualine").setup({
    options = { theme = "tokyonight" }
})

-- nvimtree
require("nvim-tree").setup()

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

--Lua Language Server (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- colour scheme
vim.cmd[[colorscheme tokyonight]]

