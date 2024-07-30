vim.cmd("colorscheme nord")

vim.opt.termguicolors = true

if vim.fn.has('ttyout') == 1 then
  vim.api.nvim_set_hl(0, 'Normal', {})
  vim.api.nvim_set_hl(0, 'NormalNC', {})
end

