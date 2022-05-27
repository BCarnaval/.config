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
 Plug 'dylanaraps/wal'
 Plug 'davidgranstrom/nvim-markdown-preview'
 Plug 'jbyuki/nabla.nvim'
call plug#end()

colorscheme wal

syntax enable
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:nvim_markdown_preview_format = 'markdown'
let g:nvim_markdown_preview_theme = 'solarized-light'

autocmd FileType tex VimtexCompile
nnoremap <leader>p :lua require("nabla").popup()<CR>
