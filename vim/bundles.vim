if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Interface builders
  call dein#add('Shougo/unite.vim')

  " Start screen
  call dein#add('mhinz/vim-startify')

  " File opening
  call dein#add('~/.fzf')
  call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})

  " File explorer
  call dein#add('Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'})

  " Outline viewer
  call dein#add('majutsushi/tagbar', {'on': 'TagbarToggle'})

  " Status/Indent line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('Yggdroot/indentLine')

  " Automation
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tpope/vim-surround')
  call dein#add('bkad/CamelCaseMotion')

  " Linting
  call dein#add('vim-syntastic/syntastic')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('mhinz/vim-signify')

  " A solid language pack for Vim
  call dein#add('sheerun/vim-polyglot')

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Ruby
  call dein#add('tpope/vim-rails', {'on_ft': 'ruby'})
  call dein#add('fishbullet/deoplete-ruby', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-endwise', {'on_ft': 'ruby'})

  " Python
  call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
  call dein#add('gotcha/vimpdb', {'on_ft': 'python'})

  " JavaScript
  call dein#add('carlitux/deoplete-ternjs', {'on_ft': 'javascript'})

  " Theming
  call dein#add('gmist/vim-palette')

  " Editorconfig
  call dein#add('editorconfig/editorconfig-vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
