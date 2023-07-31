"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set title
"Mostra os comendos sendo excutados
set showcmd
set showmode
set clipboard=unnamedplus
set cursorline
set is hls ic scs
set tabstop=4
set expandtab
set number
set autoindent
set nocompatible
set mouse=a
set cursorline
set encoding=UTF-8
set nobackup
set ignorecase
set t_Co=256
set foldlevel=99
set fileformat=unix
set complete+=kspell
set completeopt=menuone,longest
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

syntax on
filetype on
filetype indent on
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ap/vim-css-color'
    Plugin 'chun-yang/auto-pairs'
    Plugin 'connorholyday/vim-snazzy'
    Plugin 'dense-analysis/ale'
    Plugin 'nvie/vim-flake8'
    Plugin 'vim-scripts/AutoComplPop'
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plugin 'junegunn/fzf.vim'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'potatoesmaster/i3-vim-syntax'
    Plugin 'vim-scripts/bash-support.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'junegunn/goyo.vim'

call vundle#end()


"não chamar

Plugin 'sheerun/vim-polyglot'

"MAPS
map q :quit<CR>
map <C-q> :quit!<CR>
map <C-s> :write<CR>
map <c-b> :colo darkblue<CR>
map <C-m> :colo molokai<CR>
map <C-a> :colo ayu<CR>
map <C-g> :Goyo <CR>
let mapleader = ","

"Maps do nerdthree


"Aurelio--{{{

set viminfo='10,\"30,:20,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

fu! CommOnOff()
  if !exists('g:hiddcomm')
    let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
  else
    unlet g:hiddcomm | hi Comment ctermfg=none  guifg=cyan term=none
  endif
endfu
map <c-h> :call CommOnOff()<cr>

"=====================================================

"Ignorar os arquivos que o vim nao lê
"set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"---}}}

"multiplecursor

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"=========================================================================="

autocmd BufEnter *.php colorscheme Tomorrow-Night
"autocmd BufEnter *.py colorscheme gruvbox8_hard
"
"            arvore de diretórios
"----------------------------------
inoremap <c-t> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-t> <Esc>:Lex<cr>:vertical resize 30<cr>
"---------------------------------------------------------------
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

highlight ALEWarning ctermbg=DarkMagenta

"ihhhh Cores do cursor para diferenciar os modos do Vim
if &term =~ "xterm\\|rxvt"
  " use an insert mode
  let &t_SI = "\<Esc>]12;#FDC212\x7"
  " use a otherwise
  let &t_EI = "\<Esc>]12;#0078A5\x7"
  silent !echo -ne "\033]12;35\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"


endif


"Tema ====================== < {{


autocmd InsertEnter * highlight CursorLine guibg=#324142 ctermfg=white ctermbg=none 
autocmd InsertLeave * highlight CursorLine guibg=black ctermfg=white ctermbg=black

hi Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

"O theme do vim
if has('termguicolors')
  set termguicolors
endif

set background=dark

colorscheme ayu 

highlight Search ctermbg=white ctermfg=green


"=============================== > fim Tema}}

setlocal laststatus=2                                    "Mostrar duas linhas.
highlight StatusLine ctermfg=blue   ctermbg=white  "Fundo azul e fonte branca.


 " **************************************************************************
  " *                                                                        *
  " *               Cor da numeração lateral                                 *
  " *                                                                        *
  " **************************************************************************
"hi LineNr     guifg=pink     ctermfg=lightMagenta
hi LineNr     guifg=#005f5f    ctermfg=lightMagenta

"fzf related customization

"fzf related customization

let $FZF_DEFAULT_OPTS .= ' --inline-info'

"Shortcut! :Files bring up the fuzzy finder
 map <C-f> <Esc><Esc>:Files!<CR>
"Shortcut! :Blines  in file and go to chosen line
inoremap <C-f> <Esc><Esc>:Blines!<CR>

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

