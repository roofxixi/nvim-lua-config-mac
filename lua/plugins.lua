local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local packer_bootstrap = nil

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes) ") ~= "y" then
    print('Please install Packer first!')
    return
  end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  print(" Downloading packer.nvim...")
  local install_path = directory .. "/packer.nvim"
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print(packer_bootstrap)

  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- -_-_-_-_- META -_-_-_-_-
  -- IMPATIENT: faster startup time {{{
    use {
      'lewis6991/impatient.nvim',
      rocks = 'mpack'
    }
    -- }}}

    use 'wbthomason/packer.nvim'

    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use {
      'iamcco/markdown-preview.nvim',
      run = ':call mkdp#util#install()',
    }

    -- 记录工作时间的
    -- use 'wakatime/vim-wakatime'
    use 'morhetz/gruvbox'

    use 'nvim-lua/plenary.nvim'

    use 'ygm2/rooter.nvim'
    use 'ahmedkhalf/project.nvim'
    use 'ryanoasis/vim-devicons'
    use 'folke/which-key.nvim' -- 助记快捷键
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary' -- gcc 添加注释
    use { 'junegunn/fzf', dir = '~/.fzf', run = ':call fzf#install()' } -- fuzzy 查找
    use 'coreyja/fzf.devicon.vim'

    use 'easymotion/vim-easymotion' -- 单词搜索
    use 'justinmk/vim-sneak' -- s 通过两个字符跳转到任意位置 ctrl-o跳回
    use 'wellle/targets.vim' -- 修改一串字符 da< cin) da{
    -- use 'rafamadriz/neon' -- 主题
    -- use 'github/copilot.vim' -- github copilot
    use 'jreybert/vimagit' -- git flow工具 看diff stage文件 写commit
    use { 'liuchengxu/vim-clap', run = ':Clap install-binary!' } -- 模糊查询，开箱即用。过滤文件、git commit、全局字符查找，功能强大！！！
    use { 'inside/vim-textobj-jsxattr', requires = {{ 'kana/vim-textobj-user' }}} -- jsx的attribute操作 ix ax操作
    use 'editorconfig/editorconfig-vim' -- .editorconfig 配置

    use 'Yggdroot/indentLine'

    use { 'lewis6991/gitsigns.nvim', requires = {{ 'nvim-lua/plenary.nvim' }}} -- git blame


    use 'mattn/emmet-vim' -- html 快速缩写

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground', requires = {{ 'nvim-treesitter/nvim-treesitter' }}}
    use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {{ 'nvim-treesitter/nvim-treesitter' }}}
    use { 'p00f/nvim-ts-rainbow', requires = {{ 'nvim-treesitter/nvim-treesitter' }}}
    use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {{ 'nvim-treesitter/nvim-treesitter' }}}

    use 'neovim/nvim-lspconfig'
    use 'ojroques/nvim-lspfuzzy'
    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use 'tami5/lspsaga.nvim'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    } -- 搜索
    use 'nvim-telescope/telescope-file-browser.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'windwp/nvim-autopairs'

    use 'tamago324/nlsp-settings.nvim'
    use 'williamboman/nvim-lsp-installer'

    use 'arkav/lualine-lsp-progress'

    use 'dstein64/vim-startuptime'

    use 'folke/lua-dev.nvim'

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
    }

    -- git graph
    use 'tpope/vim-fugitive'
    use 'rbong/vim-flog'

    -- rust 配置
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use 'simrat39/rust-tools.nvim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    -- debug相关的
    -- use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    -- use {
    --     'autozimu/LanguageClient-neovim', 
    --     run = 'bash install.sh'
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    use 'yamatsum/nvim-cursorline' -- 单词高亮
    use 'norcalli/nvim-colorizer.lua' -- 颜色
    if packer_bootstrap then
      require('packer').sync()
    end

  end)
