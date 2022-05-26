call plug#begin()
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'lervag/vimtex'
 Plug 'nvie/vim-flake8'
call plug#end()

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'