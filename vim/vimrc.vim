""""""""""""""""""""""""""""""
" => General Vim settings section
"""""""""""""""""""""""""""""""
  let mapleader=","
  set autoindent
  set tabstop=4
  set shiftwidth=4
  set dir=/tmp/
  set relativenumber 
  set number
  set encoding=utf-8

  set hlsearch
  nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

  nnoremap n nzzzv
  nnoremap N Nzzzv

  nnoremap H 0
  nnoremap L $
  nnoremap J G
  nnoremap K gg

  " folding 
"  set foldcolumn=3
" let g:SimpylFold_docstring_preview=1
"  set foldmethod=indent
"  hi Folded ctermbg=blue
"  set foldenable  
"  set foldlevelstart=1


  set backspace=indent,eol,start

  nnoremap <Space> za
  nnoremap <leader>z zMzvzz


  set listchars=tab:\|\ 
  nnoremap <leader><tab> :set list!<cr>
  set pastetoggle=<F2>
  set mouse=a
  set incsearch

""""""""""""""""""""""""""""""
" => Config file/ plugins section
"""""""""""""""""""""""""""""""
  so ~/dotfiles/vim/vim_plug.vim
  so ~/dotfiles/vim/filetypes.vim
  " Tabs
  so ~/dotfiles/vim/sleuth.vim
""""""""""""""""""""""""""""""
" => Shell section
"""""""""""""""""""""""""""""""
  " shell 
  let g:split_term_default_shell = "zsh"

  set splitright
  set splitbelow
  " python3 intergration
  let g:python3_host_prog = "/usr/local/bin/python3"
""""""""""""""""""""""""""""""
" => Dash section
"""""""""""""""""""""""""""""""
  nmap <silent> <leader>d <Plug>DashSearch
""""""""""""""""""""""""""""""
" => Sidnify section
"""""""""""""""""""""""""""""""
  let g:signify_sign_add    = '┃'
  let g:signify_sign_change = '┃'
  let g:signify_sign_delete = '•'

  let g:signify_sign_show_count = 0 " Don’t show the number of deleted lines.
""""""""""""""""""""""""""""""
" => Colorscheme section
"""""""""""""""""""""""""""""""
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  if has("gui_vimr")
    colorscheme xcodedarkhc
  else
    "colorscheme Tomorrow-Night
    colorscheme xcodedarkhc
  endif

""""""""""""""""""""""""""""""
" => Ctags section
"""""""""""""""""""""""""""""""
  let g:tagbar_type_swift = {
        \ 'ctagstype': 'swift',
        \ 'kinds' : [
        \ 'e:Enums',
        \ 't:Typealiases',
        \ 'p:Protocols',
        \ 's:Structs',
        \ 'c:Classes',
        \ 'f:Functions',
        \ 'v:Variables',
        \ 'E:Extensions',
        \ 'l:Constants',
        \ ],
        \ 'sort' : 0
        \ }

""""""""""""""""""""""""""""""
" => Python command section
"""""""""""""""""""""""""""""""
  au FileType python nmap <leader>r :!python3 %<cr>


""""""""""""""""""""""""""""""
" => statusline section
"""""""""""""""""""""""""""""""
  set statusline=...%{MyGitStatus()}...

  function MyGitStatus() abort
    let staged = gina#component#status#staged()
    let unstaged = gina#component#status#unstaged()
    let conflicted = gina#component#status#conflicted()
    let branched = gina#component#repo#branch()
    return printf(
          \ 'b: %s, s: %s, u: %s, c: %s',
          \ branched,
          \ staged,
          \ unstaged,
          \ conflicted,
          \)
  endfunction
  "set statusline=
  set statusline=[%n]\                           "buffernr
  set statusline+=%<%F\                          "File+path
  set statusline+=%y\                            "FileType
  set statusline+=%{ALEGetStatusLine()}\         "ale status"
  "set statusline+=%{fugitive#statusline()}\      "fugitive#statusline"
  set statusline+=%{MyGitStatus()}
  set statusline+=%=                             "right alignment
  set statusline+=[%{strlen(&fenc)?&fenc:&enc}]  "file encoding
  set statusline+=%-16(\ %l,%c-%v\ %)\%P         "cursor row, col, Percentage

""""""""""""""""""""""""""""""
" => Vim settings and mapping section
"""""""""""""""""""""""""""""""
  if using_vim
    " A bunch of things that are set by default in neovim, but not in vim

    " no vi-compatible
    set nocompatible

    " allow plugins by file type (required for plugins!)
    filetype plugin on
    filetype indent on

    " always show status bar
    set ls=2

    " incremental search
    set incsearch
    " highlighted search results
    set hlsearch

    " syntax highlight on
    syntax on

    " better backup, swap and undos storage for vim (nvim has nice ones by
    " default)
    set directory=~/.vim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.vim/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.vim/dirs/undos
    set viminfo+=n~/.vim/dirs/viminfo
    " create needed directories if they don't exist
    if !isdirectory(&backupdir)
      call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
      call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
      call mkdir(&undodir, "p")
    endif
  end

  " tabs and spaces handling
  set expandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4

  " show line numbers
  set nu

  " remove ugly vertical lines on window division
  set fillchars+=vert:\ 


  " needed so deoplete can auto select the first suggestion
  set completeopt+=noinsert
  " comment this line to enable autocompletion preview window
  " (displays documentation related to the selected completion option)
  " disabled by default because preview makes the window flicker
  set completeopt-=preview

  " autocompletion of files and commands behaves like shell
  " (complete only the common part, list the options that match)
  set wildmode=list:longest

  " save as sudo
  ca w!! w !sudo tee "%"

  " tab navigation mappings
  map tt :tabnew 
  map <M-Right> :tabn<CR>
  imap <M-Right> <ESC>:tabn<CR>
  map <M-Left> :tabp<CR>
  imap <M-Left> <ESC>:tabp<CR>

  " when scrolling, keep cursor 3 lines away from screen border
  set scrolloff=3

  " clear search results
  nnoremap <silent> // :noh<CR>

  " clear empty spaces at the end of lines on save of python files
  autocmd BufWritePre *.py :%s/\s\+$//e

  " fix problems with uncommon shells (fish, xonsh) and plugins running commands
  " (neomake, ...)
  set shell=/bin/zsh 

  " Ability to add python breakpoints
  " (I use ipdb, but you can change it to whatever tool you use for debugging)
  au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

""""""""""""""""""""""""""""""
" => Airline section
"""""""""""""""""""""""""""""""
  let g:airline_powerline_fonts = 0
  let g:airline_theme = 'bubblegum'
  let g:airline#extensions#whitespace#enabled = 0

  " Fancy Symbols!!
  let g:fancy_symbols_enabled = 0

  if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
  else
    let g:webdevicons_enable = 0
  endif

