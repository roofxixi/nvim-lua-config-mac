require('plugins') -- 插件
require('functions')
require('settings')
require('config')
require('mappings') -- 键位映射关系

-- %%%%%%%%%%%%%%%%%
-- 自定义字段
-- %%%%%%%%%%%%%%%%%

-- rust配置
require('rust-tools').setup({})

-- 主题
vim.cmd [[
  colorscheme gruvbox
  set background=dark
]]
vim.api.nvim_set_option('tabpagemax', 8)

-- 键位映射
vim.cmd [[
  
  inoremap jk <ESC>
]]
