call plug#begin()
 Plug 'zaki/zazen'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-surround'
 Plug 'scrooloose/nerdtree'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'sheerun/vim-polyglot'
 Plug 'chrisbra/Colorizer'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
call plug#end()

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'badwolf'

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" no bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" sets order of EOL tried when working on a new buffer
set ffs=unix,dos,mac

" TABS
set smarttab
set noexpandtab
set shiftwidth=4
set softtabstop=0
set tabstop=4

" INDENT
set autoindent
set smartindent
set wrap

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

"
"  KEYBINDINGS
"

let mapleader = ";"
set ttimeout		" time out for key codes
set ttimeoutlen=50	" wait up to 50ms after Esc for special key

" MISCELLANEOUS

" ;c - comment/uncomment selected lines lines
vmap <leader>c :Commentary<cr>
" toggle relative line numbers
nmap <leader>rnu :set rnu!<cr>
" space - folder/unfold
nnoremap <space> za

nmap <leader>[ ysiW[
nmap <leader>( ysiW(
nmap <leader>{ ysiW{
nmap <leader>' ysiW'
nmap <leader>" ysiW"

" CHANGES & GIT

" ;d - show changes made since file was last saved
nmap <leader>d :DiffOrig<cr>
" ;gs - show status of current Git repository in a new tab
nmap <leader>gs :tab :Gstatus<cr>
" ;gl - show Git log in a new tab
nmap <leader>gl :tab :Gclog<cr>

" SAVING

" ;W - save using sudo
nmap <leader>W :W<cr>
" ;w - save (force)
nmap <leader>w :w!<cr>

" QUITTING VIM

" ;q - quit current buffer
nmap <leader>q :q<cr>
" ;qq - quit all buffers
nmap <leader>qq :qa<cr>

" NAVIGATING WITHIN & BETWEEN FILES

" C-e - jump to next syntax error
nmap <silent> <C-e> <Plug>(ale_next_wrap)
" C-E - jump to previous syntax error
nmap <silent> <C-E> <Plug>(ale_previous_wrap)

" ;n - toggle nnn file manager / file selector
nmap <leader>n :NnnPicker<cr>

" ;e - toggle NERDTree
nmap <leader>e :NERDTreeToggleVCS<cr>

" ;el - toggle netrw explorer on the left
nmap <leader>el :Lexplore!<cr>
" ;er - toggle netrw explorer on the right
nmap <leader>er :Vexplore<cr>

" ;tt - open/close tagbar
nmap <leader>t :TagbarToggle<cr>
" ;t - temporarily open tagbar to jump to a particular tag
nmap <leader>tt :TagbarOpenAutoClose<cr>

" C-/ - fuzzy find lines in all open buffers
nmap C-/ :Lines<cr>
" ;/ - fuzzy find lines in current buffer
nmap <leader>/ :BLines<cr>
" ;f - fuzzy find files in current working directory
nmap <leader>f :Files<cr>
" ;b - fuzzy find open buffers
nmap <leader>b :Buffers<cr>
" ;cmd - fuzzy find previously run Vim commands
nmap <leader>cmd :History<cr>
" ;help - fuzzy find Vim help tags
nmap <leader>help :Helptags<cr>

" CHANGE WINDOW - move the cursor to the window...

" ;k - above current one
nmap <leader>k <C-w>k
" ;j - below current one
nmap <leader>j <C-w>j
" ;h - to the left of the current one
nmap <leader>h <C-w>h
" ;l - to the right of the current one
nmap <leader>l <C-w>l
" ;<space> - previously selected
nmap <leader><space> <C-w>p


" SPLIT WINDOW - split current window, creating a new view of the current buffer...

" C-j - below the current one
nmap <C-j> :belowright split<cr>
" C-k - above the current one
nmap <C-k> :split<cr>
" C-h - to the left of the current one
nmap <C-h> :vsplit<cr>
" C-l - to the right of the current one
nmap <C-l> :belowright vsplit<cr>

" NEW WINDOW - create a new window and interactive choose and open buffer to populate it

" ;J - below the current window
nmap <leader>J :belowright new<cr>
" ;K - above the current window
nmap <leader>K :new<cr>
" ;H - to the left the current window
nmap <leader>H :vnew<cr>
" ;L - to the right of the current window
nmap <leader>L :belowright vnew<cr>

" RESIZE WINDOW

" C-down - upwards
nmap <C-down> <C-w>-
" C-down - downwards
nmap <C-up> <C-w>+
" C-right - to the left
nmap <C-right> <C-w><
" C-left - to the right
nmap <C-left> <C-w>>

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

tnoremap <Esc> <C-\><C-n>
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l

autocmd BufWinEnter,WinEnter term://* startinsert

set shell=/usr/bin/zsh

colorscheme zazen
let g:airline_theme = 'badwolf'

