set number
set autoindent
syntax on
set display+=lastline
set laststatus=2

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = ","


let g:ale_linters = {
      \   'python': ['flake8'],
	\}

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }



" Open corresponding.pdf
	map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

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
augroup END


" Groff options
	" Load template when creating a new file
	au BufNewFile *.ms r $HOME/.vim/templates/groff/template.ms

	" Set file type to groff
	au BufNewFile,BufRead *.ms set filetype=groff

	" Insert matrix templates
	autocmd FileType groff nnoremap <leader>m :-1read $HOME/.vim/templates/groff/matrix.ms<CR>/ccol {<CR>5l i
