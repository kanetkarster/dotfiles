"basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
"essential
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-fugitive'
"Special
"LaTeX
Plugin 'xuhdev/vim-latex-live-preview'

"Rust

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
autocmd Filetype tex setl updatetime=2000
nmap <F12> :LLPStartPreview<cr>
