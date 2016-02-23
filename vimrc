call pathogen#infect()
Helptags

filetype plugin indent on
syntax on

set showtabline=2
set background=dark
"colors wombat
"colors peaksea
colors xoria256

if has("gui_running")
    " For windows, needs an if-statement
    " set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
    " set lines=40 columns=200

    if has("gui_gtk2")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
        set lines=40 columns=200
    endif

    if has("gui_macvim")
        " set guifont=Courier\ New:h18
        set guifont=Sauce\ Code\ Powerline\ Light:h15
    endif
endif

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Setup variables
let $SESDIR = '~/.vim/sessions'
let mapleader = ","
let maplocalleader = ","
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_max_height = 20
let g:omni_sql_no_default_maps = 1
let g:instant_markdown_slow = 1
let g:manpageview_pgm = "pman"
let g:manpageview_pgm_php = "pman"
let g:taboo_renamed_tab_format = " %l%m "

" NERD Commenter
let NERDSpaceDelims=1
let NERDDefaultNesting=1

set fileencoding=utf-8
set fileformat=unix

" Show list characters
set list
set listchars=tab:>-,trail:-,nbsp:+

set splitright      " Open spit windows on right side
set ruler           " Ruler on status bar
set number          " Line numbers to the left
set ignorecase      " Ignore case when searching
set smartcase       " Good combo with ignorecase
set expandtab       " Tab thingys
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent      " Autoindent is usually nice
set nowrap          " Don't wrap the text
set nohls           " Don't Highlight search by default
"set cursorcolumn    " Indicator of where the cursor is
set cursorline      "
set hidden          " Make sure VIM won't whine about hidden buffers
set showcmd         " Let you see commands you're typing
set nobackup        " No backup
set noswapfile      " No swapfiles
set wildmode=list:longest,full
set scrolloff=10
set pastetoggle=<F9>
set mouse=a
set autoread
" Folding
" set foldmethod=indent
" set foldminlines=2
" set foldnestmax=20
" set foldlevelstart=99
" set foldlevel=0

" vim-airline (Fancy thingy at bottom stuff)
let g:airline_powerline_fonts = 1 " For fancy powerline symbols
let g:airline_theme = 'powerlineish'
set laststatus=2                  " Always show the statusline
set noshowmode                    " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Vimdiff specific settings
if &diff
    " Quit and don't save anything
    nnoremap <Leader>q :qa!<cr>
endif

" Filetype plugins should autoload
filetype plugin on

nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tm :NERDTreeMirror<CR>

" Make it possible to add empty lines without entering insert mode
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>

nnoremap <F4> :bd<CR>

" Window resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <Leader>ö :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <Leader>ä :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"
" Headline boxes
"
" Box with S P A C E between letters
vnoremap <Leader>bh :!boxes -ahc -s 76 -d headline<CR>
nnoremap <Leader>bh V:!boxes -ahc -s 76 -d headline<CR>
" Box with regular text
vnoremap <Leader>bc :!boxes -ahc -s 76 -d c<CR>
nnoremap <Leader>bc V:!boxes -ahc -s 76 -d c<CR>
" Shell box with # instead of *
vnoremap <Leader>bs :!boxes -ahc -s 80 -d shell<CR>
nnoremap <Leader>bs V:!boxes -ahc -s 80 -d shell<CR>

" Replace " with '
vnoremap <Leader>' :s/"/'/g<CR>
nnoremap <Leader>' :s/"/'/g<CR>

" Align by = signs
vnoremap <Leader>= :Tabularize /\(=>\\|\(!\)\@<!=\)<CR>
" Align by ,
vnoremap <Leader>, :Tabularize /,\zs/l0r1<CR>
" Align by :
vnoremap <Leader>: :Tabularize /^[^:]*\zs:\zs/l0r1<CR>

" Quick access to different tabs
nnoremap <Leader>1 :tabnext 1<CR>
nnoremap <Leader>2 :tabnext 2<CR>
nnoremap <Leader>3 :tabnext 3<CR>
nnoremap <Leader>4 :tabnext 4<CR>
nnoremap <Leader>5 :tabnext 5<CR>
nnoremap <Leader>6 :tabnext 6<CR>
nnoremap <Leader>7 :tabnext 7<CR>
nnoremap <Leader>8 :tabnext 8<CR>
nnoremap <Leader>9 :tabnext 9<CR>
nnoremap <Leader>0 :tabnext 10<CR>

" Search within a visual block
vnoremap <Leader>/ <Esc>/\%V
vnoremap <Leader>? <Esc>?\%V

" Jump to column 81
nnoremap <Leader>8 81\|

" Open VIMRC quickly
nnoremap <Leader>v :tabe $MYVIMRC<CR>

" Open UltiSnips quickly
nnoremap <Leader>s :UltiSnipsEdit<CR>
nnoremap <Leader>us :tabe<CR>:cd $HOME/.vim/ultisnips<CR>:CtrlP<CR>

" CtrlP
nnoremap <Leader>bu :CtrlPBuffer<CR>

" Remapping for save
inoremap <F1> <C-\><C-O>:w<CR>
noremap  <F1> :w<CR>

" Tagbar mapping
nmap <F2> :TagbarOpen fj<CR>
nmap <F3> :TagbarClose<CR>

" Set Colors
hi CursorLine   cterm=NONE ctermbg=8 gui=NONE guibg=#555555
hi CursorColumn cterm=NONE ctermbg=8 gui=NONE guibg=#555555

" Make group to be able to clear au-cmds, so sourcing .vimrc
" won't duplicate au-cmds.
augroup mygroup
    " Clear autocommands in this group
    au!

    " Git commit settings
    au FileType gitcommit set textwidth=72

    " Override crap php indent-crap-fuck-shit-fuck
    au FileType php set autoindent

    " Set filetype to PHP when we edit a *.tpl file
    au BufNewFile,BufRead *.tpl set filetype=php

    " Automagicaly re-read the .vimrc if it's edited
    au BufWritePost $MYVIMRC source $MYVIMRC

    " Automagicaly trim whitespaces when saving a file
    au BufWritePre * :%s/\s\+$//e

    " Detect file change in shell
    "au FileChangedShell * echo "Warning: File changed on disk"
    au BufEnter,BufWinEnter,InsertEnter,CursorHold filename :checktime

augroup END

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|adodb.*\|fonts\|jpgraph$\|libchart$\|mpdf.*\|pChart\|pear$\|xpm$\|pics|demo|images|localization$',
    \ 'file': '\.exe$\|\.so$\|\.dll|\.png|\.jpg|\.jpeg|\.gif$',
\ }

let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'f:functions',
    \ ],
\ }
