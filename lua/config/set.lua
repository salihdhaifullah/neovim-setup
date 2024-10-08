vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 1000


vim.cmd([[
    set laststatus=0
    hi! link StatusLine Normal
    hi! link StatusLineNC Normal
    set statusline=%{repeat('─',winwidth('.'))}
]])

local symbols = { Error = "󰅙", Warn = "", Info = "󰋼", Hint = "󰌵" }
local symbols_array = { [1] = "󰅙", [2] = "", [3] = "󰋼", [4] = "󰌵" }

for name, icon in pairs(symbols) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end


vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            if diagnostic.severity > 0 and diagnostic.severity < 5 then
                return string.format("%s %s", symbols_array[diagnostic.severity], diagnostic.message)
            end
            return diagnostic.message
        end,
        prefix = "",
    },
})
