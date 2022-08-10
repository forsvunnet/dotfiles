
" Show hidden files when using ctrl+p
let g:ctrlp_show_hidden = 1

"" ctr+n will open and close NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>
"" <leader> + o will open NERDTree in the file your editing
nnoremap <leader>o :NERDTreeFind<CR>

" Use fzf to find files
nmap <C-P> :FZF<CR>

call plug#begin()
" Plugins

" Fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Git support inside vim (useing :G)
Plug 'tpope/vim-fugitive'

" LSP Support & code autocompletion
" [IMPORTANT] Install language servers using vim:
" :CocInstall coc-json coc-tsserver coc-phpls coc-html coc-css coc-tailwind
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP Support
Plug 'stanangeloff/php.vim'

" PHP CS Fixer
Plug 'stephpy/vim-php-cs-fixer'

" Automatically generate ctags when using vim
" [IMPORTANT] Requires universal ctags 
" On OSX `brew install universal-ctags`
Plug 'ludovicchabant/vim-gutentags'

" Emmet completions
Plug 'mattn/emmet-vim'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" Nerd Tree - file navigation
Plug 'preservim/nerdtree' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Clever string functions

" Abolish
" introduces coerce command which is `cr` + type
" snake_case (crs)
" MixedCase (crm)
" camelCase (crc)
" snake_case (crs)
" UPPER_CASE (cru)
" dash-case (cr-)
" dot.case (cr.)
" space case (cr<space>)
" Title Case (crt)
Plug 'tpope/vim-abolish'

" Vim surround
Plug 'tpope/vim-surround'

" Commentary
Plug 'tpope/vim-commentary'

call plug#end()

