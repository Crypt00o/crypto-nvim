
call plug#begin()
Plug 'http://github.com/ARM9/arm-syntax-vim' " For Assembly arm32 
Plug 'https://github.com/kezhenxu94/vim-mysql-plugin.git' " For Mysql Management
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim' , {'branch': 'release' , 'do':':CocInstall coc-explorer coc-git'}   " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/shaunsingh/moonlight.nvim' " moonlight theme
Plug 'https://github.com/marko-cerovac/material.nvim'	"material-theme
Plug 'https://github.com/andweeb/presence.nvim' " for discord activity 
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim' " for searching inside files 
Plug 'https://github.com/junegunn/fzf.vim' " for searching and quick fuzzy search 
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/catppuccin/nvim', { 'as': 'catppuccin' } "beautiful theme
Plug 'https://github.com/tpope/vim-dadbod' " for all kinds of databases Management 
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui' " database Management throw ui 
Plug 'https://github.com/tpope/vim-dotenv' "plug for .env file variables
Plug 'https://github.com/diepm/vim-rest-console' "vim restapi plug
Plug 'https://github.com/turbio/bracey.vim', {'do': 'npm install --prefix server'} "plug for live server editing html,css (hot reload)
Plug 'https://github.com/preservim/tagbar' " to dispaly classes , functions , variables Tagbar for code navigation
Plug 'https://github.com/airblade/vim-gitgutter' " show new git commits
Plug 'https://github.com/tpope/vim-fugitive' " git  control
Plug 'https://github.com/tpope/vim-rhubarb'  "show commits in browser
Plug 'https://github.com/wakatime/vim-wakatime' "sync time spended in nvim 
call plug#end()


function SetOptions()
	  set updatetime=250
	  set number
	  set autoindent
	  set tabstop=4
	  set shiftwidth=6
	  set smarttab
	  set softtabstop=4
	  set mouse=a
	  set encoding=UTF-8
	  colorscheme catppuccin
endfunction

function CryptoStack()
	  echo "[+] Installing CryptoStack"
	  CocInstall  coc-snippets coc-tsserver  coc-rust-analyzer coc-python coc-clangd coc-sh @yaegassy/coc-tailwindcss3 coc-css  coc-react-refactor coc-html   coc-webview coc-markdown-preview-enhanced coc-eslint coc-prettier coc-restclient 
endfunction


function SetGlobals()
	  let g:airline_powerline_fonts = 1

	  if !exists('g:airline_symbols')
			let g:airline_symbols = {}
	  endif

 " Use fontawesome icons as signs for vimgitgutter
	  let g:gitgutter_sign_added = '+'
	  let g:gitgutter_sign_modified = ''
	  let g:gitgutter_sign_removed = '-'
	  let g:gitgutter_sign_removed_first_line = '^'
	  let g:gitgutter_sign_modified_removed = ''

" airline symbols
	  let g:airline_left_sep = ''
	  let g:airline_left_alt_sep = ''
	  let g:airline_right_sep = ''
	  let g:airline_right_alt_sep = ''
	  let g:airline_symbols.branch = ''
	  let g:airline_symbols.readonly = ''
	  let g:airline_symbols.linenr = ''

"presence nvim options
" General options
	  let g:presence_auto_update         = 1
	  let g:presence_neovim_image_text   = "The One True Text Editor"
	  let g:presence_main_image          = "neovim"
	  let g:presence_client_id           = "793271441293967371"
"let g:presence_log_level
	  let g:presence_debounce_timeout    = 10
	  let g:presence_enable_line_number  = 0
	  let g:presence_blacklist           = []
	  let g:presence_buttons             = 1
	  let g:presence_file_assets         = {}
	  let g:presence_show_time           = 1

" Rich Presence text options
	  let g:presence_editing_text        = "Editing %s"
	  let g:presence_file_explorer_text  = "Browsing %s"
	  let g:presence_git_commit_text     = "Committing changes"
	  let g:presence_plugin_manager_text = "Managing plugins"
	  let g:presence_reading_text        = "Reading %s"
	  let g:presence_workspace_text      = "Working on %s"
	  let g:presence_line_number_text    = "Line %s out of %s"
endfunction

function OpenTerminal()
     belowright split 
     terminal 
endfunction

function NewTab()
	tab new
    CocCommand explorer . --toggle
endfunction

function OpenCocExlporerInSplitWindow()
	  CocCommand explorer . --toggle
endfunction

function CustomDBUI()
	CocCommand explorer exit
	DBUI
endfunction

function AutoCmd()
	  set completefunc=emoji#complete
	  autocmd VimEnter * :exec OpenCocExlporerInSplitWindow() 
	  autocmd BufRead,BufNewFile *.asm set filetype=nasm  "intel asm syntax
	  autocmd BufRead,BufNewFile *.s,*.S  set filetype=arm "arm = armv6/7
endfunction

function SetKeyMaps()

	  nnoremap <Leader>gb :Gblame<CR>  
	  " git blame
" Find files using Telescope command-line sugar.
	  nnoremap fff <cmd>Telescope find_files<cr>
	  nnoremap ffg <cmd>Telescope live_grep<cr>
	  nnoremap ffb <cmd>Telescope buffers<cr>
	  nnoremap ffh <cmd>Telescope help_tags<cr>
	  nnoremap ssg <cmd>Ag<cr>
	  nmap <F8> :TagbarToggle<CR>
	  nnoremap <leader>w :wincmd w<CR>
	  nnoremap <C-n> :NERDTree<CR>
	  nnoremap <C-t> <cmd>CocCommand explorer --toggle<CR>
	  nnoremap <C-f> :Telescope find_files<CR>
	  nnoremap <C-d> <cmd>exec CustomDBUI()<CR>
	  inoremap <C-d> <esc> <cmd> exec CustomDBUI()<cr>	

" save & exit quick keys
	  inoremap <C-s> <esc>:w!<cr>                 "save files
	  nnoremap <C-s> :w!<cr>
"inoremap <C-d> <esc>:wq!<cr>               "save and exit
"nnoremap <C-d> :wq!<cr>
	  inoremap <C-q> <esc>:q!<cr>               "quit discarding changes
	  nnoremap <C-q> :q!<cr>

"Terminal Split
	  inoremap <C-z> <esc> :exec OpenTerminal()<cr>		"opening terminal
	  nnoremap <C-z> :exec OpenTerminal()<cr>

"Terminal Tap
	  inoremap <Leader>t <esc> :exec NewTab()<cr>		"opening new tab 
	  nnoremap <Leader>t :exec NewTab()<cr>

	  tnoremap <Esc> <C-\><C-n>  " Escape to out terminal mode 

" next tap & previous tap
	  nnoremap <C-Left> :tabprevious<CR>
	  nnoremap <C-Right> :tabnext<CR>


" undo 
	  nnoremap <C-u> :undo <CR>


" Use ctrl-[hjkl] to select the active split!
	  nmap <silent> <c-k> :wincmd k<CR>
	  nmap <silent> <c-j> :wincmd j<CR>
	  nmap <silent> <c-h> :wincmd h<CR>
	  nmap <silent> <c-l> :wincmd l<CR>


"copy and paste and cut  with normal shortcuts ctrl+c ctrl+v ctrl+x
	  vmap <C-c> "+yi
	  vmap <C-x> "+c
	  vmap <C-v> c<ESC>"+p
	  imap <C-v> <ESC>"+pa
"select all
      inoremap <C-a><ESC> ggVG
	  nnoremap <C-a> ggVG
	  
"rest api by coc-rest
	  nnoremap <Leader>0 <cmd> CocCommand rest-client.request <cr> 
	  inoremap <Leader>0<Esc> <cmd> CocCommand rest-client.request <cr>
	  inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
endfunction

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line

function Init()
	  exec SetGlobals()
	  exec SetOptions()
	  exec SetKeyMaps()
	  exec AutoCmd()
endfunction



exec Init()
