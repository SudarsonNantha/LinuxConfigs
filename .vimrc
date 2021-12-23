set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set autoindent
syntax on
set display+=lastline
set laststatus=2

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white

let mapleader = ","

" Enable spell check
    map <leader>s :set spell spelllang=en_us<CR>

" Disable spell check
    map <leader>S :set nospell<CR>

" Open corresponding.pdf
	map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

" Alternate compiler
    map <leader>x :!executer <c-r>%<CR>

" Open File Explorer
	map <leader>e :Ex<CR>

" Close current buffer (back)
" USeful for closing FZF
	map <leader>b :bd<CR>

" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Options based on filetype
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave		" Set file type to octave if *.m or *.oct
  au! BufRead,BufNewFile *.txt set spell spelllang=en_gb	" Turn on spell check for *.txt

  " Curly backet completetion for scala
  au BufRead,BufNewFile *.scala inoremap { {<CR>}<Esc>ko<tab>
augroup END

" Groff options
	" Load template when creating a new file
	au BufNewFile *.ms r  $HOME/.vim/templates/groff/ms_template.ms
    au BufNewFile *.mom r $HOME/.vim/templates/groff/mom_template.mom

    " Set file type to groff
	au BufNewFile,BufRead *.ms,*.mom set filetype=groff

	" Insert matrix templates
	autocmd FileType groff nnoremap <leader>m :-1read $HOME/.vim/templates/groff/matrix.ms<CR>/ccol {<CR>5l i


"    inoremap { <c-o>:call InsertPeriod()<cr>

"    :inoremap <CR> <CR><C-O>:call InsertPeriod()<CR>
"    inoremap <CR> <CR>: call InsertPeriod()<CR>
"
"    function InsertPeriod()
"        if matchstr(getline('.'), '\%' . col('.') . 'c.') == " "
"            echom "EMPTY"
"            execute <CR>A.
"        else
"            echom "NOT Empty"
"        endif
"
"    endfunction


" Mappings for YouCompleteMe
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>                " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>                "turn on YCM

" Colours and highlighting
highlight nroffEquation ctermfg=red guifg=#00ffff
highlight groffCode ctermfg=green guifg=#00ffff


