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
 "
 "PYWAL & THEMES
 Plug 'glepnir/dashboard-nvim'
 Plug 'liuchengxu/vim-clap'
 Plug 'romgrk/barbar.nvim'
 Plug 'airblade/vim-gitgutter'
 Plug 'folke/which-key.nvim'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'catppuccin/nvim', {'as': 'catppuccin'}
 "
 "MARKDOWN
 Plug 'godlygeek/tabular'
 Plug 'elzr/vim-json'
 Plug 'plasticboy/vim-markdown'
 Plug 'vim-pandoc/vim-pandoc-syntax'
 Plug 'ncm2/ncm2-markdown-subscope'
 Plug 'raghur/vim-ghost'
 "
 "PYTHON
 Plug 'dense-analysis/ale'
 Plug 'jiangmiao/auto-pairs'
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'deoplete-plugins/deoplete-jedi'
 Plug 'davidhalter/jedi-vim'
 Plug 'sbdchd/neoformat'
 Plug 'neomake/neomake'
 "
 "TEXT FILES
 Plug 'mechatroner/rainbow_csv'
 call plug#end()

"Global settings
"------------------------------------------------------
syntax enable

set nu

lua << EOF
  require("which-key").setup {
  }
  require('lualine').setup {
	  options = { theme  = 'catppuccin' }
  }
  local catppuccin = require("catppuccin")
EOF

let g:deoplete#enable_at_startup = 1

"Map jk to escape TERM
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

"Nerd settings (tree & commenter)
"------------------------------------------------------
nnoremap <C-n> :NERDTree<CR>

"Pywal settings
"------------------------------------------------------
let g:catppuccin_flavour = "frappe" " latte, frappe, macchiato, mocha
colorscheme catppuccin

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
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my_snips"]

"Markdown settings
"-----------------------------------------------------
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
function! s:SetupGhostBuffer()
    if match(expand("%:a"), '\v/ghost-(overleaf)\.com-')
        set ft=tex
    endif
endfunction
augroup vim-ghost
    au!
    au User vim-ghost#connected call s:SetupGhostBuffer()
augroup END

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
let b:ale_fixers = {'python': ['autopep8']}

autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=79
autocmd FileType python set expandtab
autocmd FileType python set autoindent
autocmd FileType python set fileformat=unix

"Markdown settings
"-----------------------------------------------------
autocmd FileType md set textwidth=79
autocmd FileType md set tabstop=2

"BarBar settings
"
nnoremap <leader>z :BufferPrevious<cr>
nnoremap <leader>x :BufferNext<cr>
nnoremap <leader>q :BufferClose<cr>










