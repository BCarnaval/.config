"Neovim Plugins (via vim-plug)
"------------------------------------------------------
call plug#begin()
 "
 "ICONS
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'ryanoasis/vim-devicons'
 "
 "SNIPPETS
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 "
 "NERD
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'lervag/vimtex'
 "PYWAL
 Plug 'dylanaraps/wal'
 Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
 "
 "MARKDOWN
 Plug 'davidgranstrom/nvim-markdown-preview'
 Plug 'catppuccin/nvim', {'as': 'catppuccin'}
 Plug 'rcarriga/nvim-notify'
 Plug 'glepnir/dashboard-nvim'
 Plug 'liuchengxu/vim-clap'
 Plug 'romgrk/barbar.nvim'
 Plug 'airblade/vim-gitgutter'
 Plug 'folke/which-key.nvim'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 "
 "PYTHON
 Plug 'nvie/vim-flake8'
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'jiangmiao/auto-pairs'
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'deoplete-plugins/deoplete-jedi'
 Plug 'Shougo/deoplete.nvim',
 Plug 'davidhalter/jedi-vim'
 Plug 'sbdchd/neoformat'
 Plug 'neomake/neomake'
call plug#end()


"Global settings
"------------------------------------------------------
syntax enable

set nu

lua << EOF
  require("which-key").setup {
  }
  require('lualine').setup {
  options = { theme  = 'pywal' }
  }
EOF

let g:deoplete#enable_at_startup = 1


"Nerd settings (tree & commenter)
"------------------------------------------------------
nnoremap <C-n> :NERDTree<CR>


"Pywal settings
"------------------------------------------------------
colorscheme pywal

"Vimtex settings
"------------------------------------------------------
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
autocmd FileType tex VimtexCompile


"UltiSnips settings
"-----------------------------------------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


"MarkdownPreview settings
"-----------------------------------------------------
let g:nvim_markdown_preview_format = 'markdown'
let g:nvim_markdown_preview_theme = 'solarized-light'


"Telescope settings
"-----------------------------------------------------
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"Python & PEP8 settings
"-----------------------------------------------------
let g:neomake_python_enabled_makers = ['pylint']

autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=79
autocmd FileType python set expandtab
autocmd FileType python set autoindent
autocmd FileType python set fileformat=unix














