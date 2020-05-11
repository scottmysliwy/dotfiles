
" initialization of vim and vim_plug
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0

let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Active plugins
" You can disable or add new ones here:
call plug#begin("~/.config/nvim/plugged")

so ~/dotfiles/vim/plugins.vim

call plug#end()
" Custom configurations 

" Include user's custom nvim configurations
let custom_configs_path = "~/.config/nvim/custom.vim"
if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

