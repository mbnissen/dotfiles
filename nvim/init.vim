" Vim-Plug
call plug#begin('~/.local/share/nvim/plugged')

" True snippet and additional text editing support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" TypeScript syntax
Plug 'HerringtonDarkholme/yats.vim'

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'

" Testing
Plug 'vim-test/vim-test'

" Other
Plug 'tpope/vim-surround'
Plug 'wsdjeg/vim-todo'

" End Vim-Plug
call plug#end()

" Settings
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/coc_settings.vim
source $HOME/.config/nvim/nerdtree_settings.vim
" Theme
" source $HOME/.config/nvim/colors/lucid.vim
" source $HOME/.config/nvim/colors/molokai.vim
source $HOME/.config/nvim/colors/gruvbox.vim
