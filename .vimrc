execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

:color desert

highlight String ctermfg=LightGray
highlight Comment ctermfg=LightGray

set ruler
set number
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab splitright
set clipboard=unnamed

let g:javascript_plugin_jsdoc = 1

let g:user_emmet_settings = {
\  'indentation':'    ',
\  'html':{
\    'indentation':'    ',
\  },
\  'javascript':{
\    'indentation':'  ',
\  }
\}

let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Auto change dir to dir of current file
autocmd BufEnter * lcd %:p:h

" Set cursor to same location as lat time file edited
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Trim trailing whitespace in js files
autocmd BufWritePre *.js normal m` :%s/\s\+$//e

augroup HelpInTabs
  autocmd!
  autocmd BufEnter *.txt call HelpInNewTab()
augroup END

" Only apply to help files
function! HelpInNewTab()
  if &buftype == 'help'
    "Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction
