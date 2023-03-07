" Vim-Plug
call plug#begin('~/.local/share/nvim/plugged')

function! NvimNodeUpdate(args)
    !npm install 
        " npm could also be yarn or pnpm
    UpdateRemotePlugins
endfunction

" True snippet and additional text editing support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'carlosgaldino/elixir-snippets'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'

" Testing
 Plug 'vim-test/vim-test'

 " LaTeX
 Plug 'lervag/vimtex'

" JSON
Plug 'yanick/nvim-jq', { 'do': function('NvimNodeUpdate') }

Plug 'vim-autoformat/vim-autoformat'

" End Vim-Plug
call plug#end()

" LaTeX format
let g:formatdef_latexindent = '"latexindent -"'

" Settings
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/coc_settings.vim
source $HOME/.config/nvim/nerdtree_settings.vim
" Theme
" source $HOME/.config/nvim/colors/lucid.vim
" source $HOME/.config/nvim/colors/molokai.vim
source $HOME/.config/nvim/colors/gruvbox.vim
" source $HOME/.config/nvim/colors/atom-dark.vim
