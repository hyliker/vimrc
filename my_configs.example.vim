set nu
"set t_Co=256
"colorscheme peaksea
colorscheme desert
"Set mapleader
let mapleader = ";"
let g:mapleader = ";"
map ;t :tabe 

filetype plugin on

"comment code
map cc ,c<SPACE>


set et ts=4 sw=4 sts=4
"Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"Remove the Windows ^M - when the encodings gets messed up:
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Toggle paste mode on and off:
map <leader>pp :setlocal paste!<cr>

"Open MRU.vim and see the recently open files:
map <leader>f :MRU<CR>

let g:ctrlp_map = '<c-f>'

"Fast saving of a buffer:
nmap <leader>w :w!<cr>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"autocmd BufWritePre * :%s/\s\+$//e

set wrap
set linebreak
" note trailing space at end of next line
" set showbreak=>\ \ \



autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS ts=2 sts=2 sw=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags ts=2 sts=2 sw=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS ts=2 sts=2 sw=2


let g:closetag_html_style=1


"Auto completion using the TAB key
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction

"Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
