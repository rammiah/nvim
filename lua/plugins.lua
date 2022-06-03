local use = require("packer").use
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- color theme
    use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }
    use 'overcache/NeoSolarized'
    use 'NLKNguyen/papercolor-theme'
    use 'mrtazz/molokai.vim'
    use 'rakr/vim-one'
    -- nerd tree
    use { 'preservim/nerdtree', requires = { 'Xuyuanp/nerdtree-git-plugin' } }
    -- dev icons
    use 'ryanoasis/vim-devicons'
    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', requires = 'p00f/nvim-ts-rainbow' }
    -- commenter
    use 'preservim/nerdcommenter'
    -- bufferline (新增)
    use { 'akinsho/bufferline.nvim', tag = "*", requires = { 'kyazdani42/nvim-web-devicons' } }
    -- vim-go
    -- use 'fatih/vim-go'
    use { 'rammiah/nvim-go', requires = { 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify' } }
    use 'rammiah/gocommand.vim'
    -- coc.nvim
    use { 'rammiah/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
    use 'fannheyward/telescope-coc.nvim'
    -- air-line
    use { 'vim-airline/vim-airline', requires = { 'vim-airline/vim-airline-themes' } }
    -- git
    -- use 'tpope/vim-fugitive'
    -- lexima
    use { 'cohama/lexima.vim' }
    -- surround
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    -- blamer
    -- use 'APZelos/blamer.nvim'
    use { 'ojroques/vim-oscyank', branch = 'main' }
    -- suda sudo write
    use 'lambdalisue/suda.vim'
    -- telescope and plugins
    use { 'nvim-telescope/telescope.nvim', requires = {
        -- lazygit
        { 'kdheepak/lazygit.nvim', requires = 'nvim-lua/plenary.nvim' },
        -- funcs
        'nvim-lua/plenary.nvim',
        {
            -- fzf support
            'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
        },
        'nvim-lua/popup.nvim'
    } }
    -- neovim start time
    use 'dstein64/vim-startuptime'
    -- git diff view
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
