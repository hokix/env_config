:filetype plugin on

set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle'
Plugin 'scrooloose/nerdtree'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
"Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'taglist.vim'
"Plugin 'aperezdc/vim-template'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'DoxygenToolkit.vim'
"Plugin 'Shougo/neocomplete'
Plugin 'Mark--Karkat'
" 在头文件和源文件直接切换
Plugin 'a.vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'honza/vim-snippets'
"Plugin 'Rip-Rip/clang_complete'
Plugin 'yggdroot/indentline'
Plugin 'godlygeek/tabular'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
" color schemes
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/SudoEdit.vim'
call vundle#end()

"set foldmethod=indent
"set foldlevel=99

"let mapleader="\\"
let mapleader=","

set hlsearch
set incsearch
set nocompatible    " Use Vim defaults (much better!)
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set showcmd
set mouse=

syntax on
syntime on
filetype on
set autoindent
filetype plugin indent on
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf8,gbk

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview

set number
"let loaded_matchparen=1

" highlighting the current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline "cursorcolumn
au InsertEnter * set nocursorline nocursorcolumn
au InsertLeave * set cursorline "cursorcolumn
set cursorline "cursorcolumn

set tabstop=4 shiftwidth=4 softtabstop=4

"if bufwinnr(1)
"    map + <C-W>+
"    map - <C-W>-
"    map < <C-W><
"    map > <C-W>>
"endif

set t_Co=256
"colo ron 
"colo molokai
colo jellybeans
"colo solarized
set background=dark

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

map <F12> :AsyncRun ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q --exclude=*.so --exclude=*.so.* --exclude=*.la --exclude=*.a --exclude=*_bin* --exclude=*_lib* --exclude=*.bin* --exclude=*.lib* --exclude=*_include* --exclude=common_inc --languages=c++ .<CR>
"map <F12> :AsyncRun -strip ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q --exclude=*.so --exclude=*.so.* --exclude=*.la --exclude=*.a --exclude=*_bin* --exclude=*_lib* --exclude=*.bin* --exclude=*.lib* --exclude=*_include* --exclude=common_inc --languages=c++ .<CR> :!cscope -Rbq <CR> cs add cscope.out <CR>

set ts=4
set expandtab
%retab!

set laststatus=2

" taglist
map <F9> :TlistToggle<CR>
imap <F9> <ESC> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 45

" NERDTree
let NERDTreeWinSize = 40
"autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F8> :NERDTreeToggle<CR>
imap <F8> :NERDTreeToggle<CR>

""neocomplete
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 1
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:username = 'hokix'
let g:email = g:username.'@live.com'

" backup & undo
set backup
set backupdir=~/.vim/tmp,.
let bakext=strftime("%y%m%d_%H%M")
let bakext="set backupext=_". bakext
execute bakext
set undodir=~/.vim/undo,.
set undofile

" a.vim
map <leader>a :AV<CR>

set wildmode=longest,list,full
set wildmenu

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

set formatoptions+=r

" auto insert head comment
autocmd bufnewfile *.cpp,*.cc,*.c so ~/.vim/templates/cpp_header.txt
autocmd bufnewfile *.cpp,*.cc,*.c exe "1," . 18 . "g#Filename:.*#s##Filename:  " .expand("%")
autocmd bufnewfile *.cpp,*.cc,*.c exe "1," . 18 . "g#Created:.*#s##Created:  " .strftime("%m/%d/%Y %H:%M:%S %p")
autocmd bufnewfile *.cpp,*.cc,*.c exe "1," . 18 . "g#Author:.*#s##Author:  " .g:username ." (" .g:email .")"

autocmd bufnewfile *.hpp,*.h so ~/.vim/templates/h_header.txt
autocmd bufnewfile *.hpp,*.h exe "1," . 18 . "g#Filename:.*#s##Filename:  " .expand("%")
autocmd bufnewfile *.hpp,*.h exe "1," . 18 . "g#Created:.*#s##Created:  " .strftime("%m/%d/%Y %H:%M:%S %p")
autocmd bufnewfile *.hpp,*.h exe "1," . 18 . "g#Author:.*#s##Author:  " .g:username ." (" .g:email .")"
let gatename = "__" .substitute(toupper(expand("%:t")), "\\.", "_", "g") ."__"
autocmd bufnewfile *.hpp,*.h exe "1," . 21 . "g#ifndef.*#s##ifndef " .gatename
autocmd bufnewfile *.hpp,*.h exe "1," . 21 . "g#define.*#s##define " .gatename
autocmd bufnewfile *.hpp,*.h exe "1," . 21 . "g#endif.*#s##endif // " .gatename

autocmd bufnewfile *.php so ~/.vim/templates/php_header.txt
autocmd bufnewfile *.php exe "1," . 17 . "g#Filename:.*#s##Filename:  " .expand("%")
autocmd bufnewfile *.php exe "1," . 17 . "g#Created:.*#s##Created:  " .strftime("%m/%d/%Y %H:%M:%S %p")
autocmd bufnewfile *.php exe "1," . 17 . "g#Author:.*#s##Author:  " .g:username ." (" .g:email .")"

autocmd Bufwritepre,filewritepre *.cpp,*.cc,*.c,*.hpp,*.h execute "normal ma"
autocmd bufwritepost,filewritepost *.cpp,*.cc,*.c,*.hpp,*.h execute "normal `a"
autocmd BufNewFile * normal G

" clang_complete
"set omnifunc=
"let g:clang_library_path='/usr/local/llvm/lib'
"let g:clang_close_preview=1
"map <C-]> :ClangGotoDeclaration<CR>
"let g:clang_jumpto_declaration_key="<C-]>"
"let g:clang_jumpto_back_key="<C-T>"
"let g:clang_use_library=1
"let g:clang_user_options='|| exit 0'
"let g:clang_complete_auto = 1
"let g:clang_debug = 1
"set completefunc=ClangComplete

" 自动关闭代码提示preview窗口
autocmd CompleteDone * pclose

" build
function! BuildCmakeProj(cmd)                                                                                                                                                                              
    if getfsize("CMakeLists.txt") <= 0
        echo "CMakeListsx.txt not found in working directory!"
        return
    endif
    if a:cmd == "build"
        if ! isdirectory("build")
            call mkdir("build")
        endif
        cd build
        exec ":AsyncRun cmake .. -DBUILD_STD=c++11 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && make -j 8"
        cd -
    elseif a:cmd == "install"
        if ! isdirectory("build")
            call mkdir("build")
        endif
        cd build
        exec ":AsyncRun cmake .. -DBUILD_STD=c++11 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && make -j 8 && make install"
        cd -
    elseif a:cmd == "clean"
        cd build
        :AsyncRun make clean
        cd -
    elseif a:cmd == "rebuild"
        call system("rm -rf build")
        call mkdir("build")
        cd build
        exec ":AsyncRun cmake .. -DBUILD_STD=c++11 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && make -j 8"
        cd -
    endif
endfu

nnoremap <F6> :silent call BuildCmakeProj("build")<cr>
nnoremap <F7> :silent call BuildCmakeProj("install")<cr>
nnoremap <F10> :silent call BuildCmakeProj("clean")<cr>
nnoremap <F11> :silent call BuildCmakeProj("rebuild")<cr>

" asyncrun
let g:asyncrun_open=10

" doxygen
"let g:DoxygenToolkit_interCommentTag=' * '
map <leader>df :Dox<CR>

" indentline
map <F5> :IndentLinesToggle<CR>

" tabularize
nmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t/ :Tabularize /\/\/<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t; :Tabularize /;\zs<CR>

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0
" airline-theme
let g:airline_theme='jellybeans'
"let g:airline_theme='molokai'
"let g:airline_theme='solarized'
"let g:airline_theme='base16'

" ack
" let g:ack_autoclose=1
" let g:ack_default_options=" -s -H --nocolor --column"
"let g:ack_use_dispatch = 1
"if executable('rg')
"    let g:ackprg = 'rg --vimgrep --smart-case'
"    let g:ackhighlight = 1
"endif
"cnoreabbrev Ack Ack!
"map <F4> :Ack <CR>

cnoreabbrev ack :AsyncRun! rg --vimgrep --smart-case 
cnoreabbrev Ack :AsyncRun! rg --vimgrep --smart-case 
map <F4> :AsyncRun! rg --vimgrep --smart-case <cword> <CR>
" nmap <Leader>r :Ack 

" quickfix window
nmap <Leader>qo :copen<CR>
nmap <Leader>qc :cclose<CR>

" location window
nmap <Leader>lo :lopen<CR>
nmap <Leader>lc :lclose<CR>

" YMC
" YCM 补全菜单配色
"" 菜单
""highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
""highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=1
"" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库tags TODO
"" set tags+=~/.vim/system
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"
"set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1
"
"" 设置YcmCompleter的跳转键映射
""nmap <silent><unique><leader>ja :YcmCompleter GoToDeclaration<CR>
""nmap <silent><unique><leader>jd :YcmCompleter GoToDefinition<CR>
""nmap <silent><unique><leader>jf :YcmCompleter GoTo<CR>
""nmap <silent><unique><leader>jg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"" 设置YCM的提示键
"let g:ycm_error_symbol='>>'
"let g:ycm_warning_symbol='>*'
"
"" cmake配置 YouCompleteMe使用
"" 在cmake中添加SET(CMAKE_EXPORT_COMPILE_COMMANDS "ON")
"" 然后再到.ycm_extra_conf中添加
"" compilation_database_folder=""
"" 这里填写之前cmake生成的compile_commands.json绝对路径
"
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'


" FZF
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" " will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>f :FZF<cr>

" cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
"let g:ale_linters = {'c++': ['clang++', 'g++']}
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
"let g:ale_keep_list_window_open = 1
let g:airline#extensions#ale#enabled = 1
" ale 配置
let g:ale_sign_column_always = 1  " 保持侧边栏可见
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'W'
"在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', 'w %d', ' OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_cpp_clang_options = '-std=c++11 -Wall'
"let g:ale_cpp_gcc_options = '-std=c++98 -Wall'
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

map <F3> :ALEDetail <CR>

