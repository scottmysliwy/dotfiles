""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
  let python_highlight_all = 1
  au FileType python syn keyword pythonDecorator True None False self

  au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent fileformat=unix
  au BufNewFile,BufRead *.jinja set syntax=htmljinja
  au BufNewFile,BufRead *.mako set ft=mako

  au FileType python map <buffer> F :set foldmethod=indent<cr>

  au FileType python inoremap <buffer> $r return 
  au FileType python inoremap <buffer> $i import 
  au FileType python inoremap <buffer> $p print 
  au FileType python inoremap <buffer> $f # --- <esc>a
  au FileType python map <buffer> <leader>1 /class 
  au FileType python map <buffer> <leader>2 /def 
  au FileType python map <buffer> <leader>C ?class 
  au FileType python map <buffer> <leader>D ?def 

""""""""""""""""""""""""""""""
" => swift c,c++ section
"""""""""""""""""""""""""""""""
  au BufNewFile,BufRead *.cpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
  au BufNewFile,BufRead *.c set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
  au BufNewFile,BufRead *.h set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
  au BufNewFile,BufRead *.swift set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix

  
  au FileType *.cpp nmap <leader>r :!g++ % \n; ./a.out <cr>
  au FileType *.cpp nmap <leader>b :!swift buld<cr>
  autocmd FileType *.cpp setlocal nofoldenable

  """"""""""""""""""""""""""""""
  " => swiftformat section
  """""""""""""""""""""""""""""""
    nnoremap <leader>F :!swiftformat %<cr>

  """"""""""""""""""""""""""""""
  " => swift command section
  """""""""""""""""""""""""""""""
     au FileType swift nmap <leader>r :!swift run<cr>
    au FileType swift nmap <leader>b :!swift buld<cr>
    au FileType swift nmap <leader>t :!swift test<cr>

  """"""""""""""""""""""""""""""
  " => autocomplete for swift section
  """""""""""""""""""""""""""""""
    autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)


  """"""""""""""""""""""""""""""
  " => CLighter Xcode section
  """""""""""""""""""""""""""""""
    if has('nvim')
      let g:clamp_autostart = 1
      let g:clamp_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
    else
      let g:clighter8_autostart = 1
      let g:clighter8_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
    endif

  """"""""""""""""""""""""""""""
  " => swift source_kitten section
  """""""""""""""""""""""""""""""
    let g:deoplete#sources#swift#source_kitten_binary = '/usr/local/bin/sourcekitten'
    let g:deoplete#sources#swift#daemon_autostart = 1
""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
  if exists('$TMUX') 
      if has('nvim')
          set termguicolors
      else
          set term=screen-256color 
      endif
  endif
""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
  autocmd BufRead *.twig set syntax=html filetype=html
  ""jfk
""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
  "dfjlk
  let vim_markdown_folding_disabled = 1
""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
  au FileType javascript call JavaScriptFold()
  au FileType javascript setl fen
  au FileType javascript setl nocindent

  au BufNewFile,BufRead *.js,*.html,*.css: set tabstop=2 softtabstop=2 shiftwidth=2
  au FileType javascript imap <C-t> $log();<esc>hi
  au FileType javascript imap <C-a> alert();<esc>hi

  au FileType javascript inoremap <buffer> $r return 
  au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

  function! JavaScriptFold() 
      setl foldmethod=syntax
      setl foldlevelstart=1
      syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

      function! FoldText()
          return substitute(getline(v:foldstart), '{.*', '{...}', '')
      endfunction
      setl foldtext=FoldText()
  endfunction
""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
  function! CoffeeScriptFold()
      setl foldmethod=indent
      setl foldlevelstart=1
  endfunction
  au FileType coffee call CoffeeScriptFold()

  au FileType gitcommit call setpos('.', [0, 1, 1, 0])


