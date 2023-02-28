lvim.log.level = "warn"
lvim.colorscheme = "tokyonight-storm"
lvim.format_on_save = false
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.showtabline = 0 -- hide show tabs
vim.opt.spelllang = { "en", "es_es" }

-- text folde options
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Activate/Deactivate core plugins
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
