local use = require("packer").use
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- color theme
  use {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use 'overcache/NeoSolarized'
  -- nerd tree
  use { 'preservim/nerdtree', requires = {'Xuyuanp/nerdtree-git-plugin'} }
  -- dev icons
  use 'ryanoasis/vim-devicons'
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- commenter
  use 'preservim/nerdcommenter'
  -- bufferline (新增)
  use 'akinsho/bufferline.nvim'
  -- coc.nvim
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- air-line
  use { 'vim-airline/vim-airline', requires = {'vim-airline/vim-airline-themes'} }
  -- rainbow
  use { 'luochen1990/rainbow' }
  -- git
  use { 'airblade/vim-gitgutter' }
  use 'tpope/vim-fugitive'
  -- lexima
  use { 'cohama/lexima.vim' }
  -- fzf
  use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = ':fzf#install()' } }
  -- surround
  use 'tpope/vim-surround'
  -- vim-go
  use 'fatih/vim-go'

end)
