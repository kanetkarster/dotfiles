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
"git
""Plugin 'vim-scripts/gitignore'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"LaTeX
Plugin 'xuhdev/vim-latex-live-preview'

"Rust
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
set hidden
let g:racer_cmd = "~/Programming/rust/racer/target/release/racer"
let RUST_SRC_PATH= "~/Programming/rust/rust/racer"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" general "
" spacing
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" include directories "
let g:syntastic_c_include_dirs = [ '../include', 'include', 'inc' ]

" c++ setup "
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" text wrap
setlocal tw=100

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
autocmd Filetype tex setl updatetime=2000
nmap <F12> :LLPStartPreview<cr>
