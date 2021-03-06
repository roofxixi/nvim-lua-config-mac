local utils = require('utils')
local set_keymap = vim.api.nvim_set_keymap

local function _map(mode, shortcut, command)
  set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function map(shortcut, command)
  _map('', shortcut, command)
end

local function nmap(shortcut, command)
  _map('n', shortcut, command)
end

local function imap(shortcut, command)
  _map('i', shortcut, command)
end

local function vmap(shortcut, command)
  _map('v', shortcut, command)
end

local function cmap(shortcut, command)
  _map('c', shortcut, command)
end

local function tmap(shortcut, command)
  _map('t', shortcut, command)
end

-- Setup for emacs keybindings
-- insert mode
set_keymap('i', '<C-b>', '<Left>', {})
set_keymap('i', '<C-f>', '<Right>', {})
set_keymap('i', '<C-a>', '<Esc>0i', {})
set_keymap('i', '<C-e>', '<End>', {})
set_keymap('i', '<C-d>', '<Del>', {})
set_keymap('i', '<C-h>', '<BS>', {})
set_keymap('i', '<C-k>', '<C-r>=KillLine()<CR>', {})
set_keymap('i', '<C-p>', '<Up>', {})
set_keymap('i', '<C-n>', '<Down>', {})

-- normal mode
set_keymap('n', '<C-p>', '<Up>', {})
set_keymap('n', '<C-n>', '<Down>', {})

-- command line mode
set_keymap('c', '<C-p>', '<Up>', {})
set_keymap('c', '<C-n>', '<Down>', {})
set_keymap('c', '<C-b>', '<Left>', {})
set_keymap('c', '<C-f>', '<Right>', {})
set_keymap('c', '<C-a>', '<Home>', {})
set_keymap('c', '<C-e>', '<End>', {})
set_keymap('c', '<C-d>', '<Del>', {})
set_keymap('c', '<C-h>', '<BS>', { noremap = true })
set_keymap('c', '<C-k>', '<C-f>D<C-c><C-c>:<Up>', { noremap = true })
-- End of setup for emacs keybindings

utils.safe_require('which-key', function(wk)
  wk.register({
    w = {
      name = '+Windows',
      s = { '<C-w>s', 'Split window below' },
      v = { '<C-w>v', 'Split window right' },
      ['-'] = { '<C-w>s', 'Split window below' },
      ['/'] = { '<C-w>v', 'Split window right' },
      w = { '<C-w>w', 'Other window' },
      j = { '<C-w>j', 'Go to the down window' },
      k = { '<C-w>k', 'Go to the up window' },
      h = { '<C-w>h', 'Go to the left window' },
      l = { '<C-w>l', 'Go to the right window' },
      d = { '<C-w>c', 'Delete window' },
      m = { '<C-w>o', 'Maximize window' },
    },
    b = {
      name = '+Buffers',
      b = { "<cmd>lua require('telescope.builtin').buffers { sort_mru = true }<CR>", 'List buffers' },
      n = { ':BufferLineCycleNext<CR>', 'Next buffer' },
      p = { ':BufferLineCyclePrev<CR>', 'Previous buffer' },
      S = {
        name = 'Sort BufferLines',
        e = { ':BufferLineSortByExtension<CR>', 'By Extensions'},
        d = { ':BufferLineSortByDirectory<CR>', 'By Directory' },
        i = { "<cmd>lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>", 'By id' }
      },
      d = { ':bw<CR>', 'Delete buffer' },
      f = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 500)<CR>", 'Format current buffer'},
    },
    f = {
      name = '+Files',
      f = { "<cmd>lua require'functions'.find_current_directory_files()<CR>", 'Find file' },
      r = { '<cmd>Telescope oldfiles<cr>', 'Open recent file', noremap = false },
      e = {
        name = 'Config files',
        d = { "<cmd>lua require'functions'.edit_neovim()<CR>", 'Open dotfiles' },
        R = { "<cmd>lua require'functions'.reload_configuration()<CR>", 'Reload configuration' },
      },
      w = {'<cmd>Telescope grep_string theme=ivy<CR>', 'Find cursor word'},
      t = { "<cmd> lua require('telescope.builtin').treesitter()<CR>", 'trees of functions/variables' },
    },
    p = {
      name = '+Projects',
      p = { '<cmd>Telescope projects theme=ivy<CR>', 'List projects' },
      f = { '<cmd>Telescope find_files<CR>', 'Find project files' }
    },
    j = {
      name = '+Jump',
      j = { '<Plug>(easymotion-s)', 'Jump to char' },
      l = { '<Plug>(easymotion-bd-jk)', 'Jump to line' },
      i = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", 'Jump to symbol' },
    },
    s = {
      name = '+Search/Symbols',
      e = { ':Lspsaga rename<CR>', 'Edit symbol' },
      s = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find { fuzzy = false,  case_mode = 'ignore_case' }<cr>", 'Search current buffer' },
      h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", 'Hover symbol' },
      p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview symbol" },
      H = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", 'Show symbol signature' },
    },
    g = {
      name = '+Git',
      s = { ':Magit<CR>', 'Magit status, see: vimagit' }, -- git????????????
      g = { ':Flog<CR>', 'Show git commit graph' }, -- git????????????
      c = { "<cmd> lua require('telescope.builtin').git_commits()<CR>", 'Show commits(grep)' }, -- git commits ?????????
      b = { "<cmd> lua require('telescope.builtin').git_branches()<CR>", 'Show branches(grep)' }, -- git branchs ?????????
    },
    e = {
      name = '+Errors',
      a = { "<cmd>lua require('telescope.builtin').diagnostics{ bufnr=0 }<CR>", 'List all errors' },
      k = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "lspsaga.diagnostic PREV"},
      j = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "lspsaga.diagnostic NEXT"},
      f = { ':Lspsaga code_action<CR>', 'Fix error' },
    },
    [';'] = {
      name = 'Comment',
      [';'] = {
        'gcc<Esc>', 'Comment line', noremap = false, mode = 'v',
      },
    },
    ["T"] = { ':Lspsaga open_floaterm<CR>', 'Open Terminal' }, -- ????????????
    ['*'] = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", 'Search reference in current project' }, -- lsp ????????????
    ['/'] = { ':Telescope live_grep<CR>', 'Fuzzy search in project' }, -- ???????????????
    ['!'] = { ':Telescope help_tags theme=ivy<CR>', 'Help commands by fuzzy search' }, -- vim????????????
    ['<Tab>'] = { ':b#<CR>', 'Last buffer' },
    ['t'] = { "<cmd> lua require('telescope.builtin').builtin()<CR>", 'Telescope current project' },
    ['<Space>'] = { "<cmd>lua require('functions').commands(require('telescope.themes').get_ivy({}))<CR>", 'Commands' }, -- ????????????
  }, { prefix = '<leader>' })
end)

-- lspconfig ???????????? https://github.com/neovim/nvim-lspconfig
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>') -- ????????????
nmap('gD', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>") -- ????????????
nmap('K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>") -- ??????????????????
nmap('<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>") -- ??????hover ???
nmap('<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>") -- ??????hover ???
nmap('gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>") -- ????????????
nmap('gS', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>") -- ????????????
nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'); -- ????????????
nmap('gr', "<cmd>lua require('lspsaga.rename').rename()<CR>") -- ?????????
nmap('ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>") -- ????????????
vmap('ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>") -- ?????????????????????
nmap('gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>") -- ?????????????????????????????????
tmap('<ESC>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>') -- ????????????
set_keymap('n', 's', '<Plug>(easymotion-overwin-f)', {})
set_keymap('n', '<leader>;;', 'gcc', {})
set_keymap('v', '<leader>;', 'gcc<esc>', {})

-- copilot
-- vim.cmd [[
--   imap <silent><script><expr> <M-.> copilot#Accept("\<CR>")
--   imap <silent><script><expr> <Tab> copilot#Accept("\<CR>")
-- ]]

vim.cmd [[

au FileType html,typescriptreact,javascriptreact EmmetInstall
au FileType html,gohtmltmpl,typescriptreact,javascriptreact imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
]]


-- ??????????????????

-- vim.cmd [[
--   autocmd BufWritePre *.rs,*.js,*.ts,*.jsx,*.tsx,*.json,*.yaml,*.toml,*.html,*.css,*.less,*.sass :lua vim.lsp.buf.formatting_sync(nil, 200)<CR>
-- ]]