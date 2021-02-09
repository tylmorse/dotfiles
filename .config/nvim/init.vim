call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/preservim/nerdtree'

Plug 'https://github.com/junegunn/fzf.vim'

Plug 'https://github.com/tpope/vim-commentary'

Plug 'https://github.com/liuchengxu/vista.vim'

Plug 'https://github.com/jeetsukumaran/vim-pythonsense'

Plug 'https://github.com/jiangmiao/auto-pairs'

Plug 'https://github.com/numirias/semshi'

Plug 'https://github.com/Vimjas/vim-python-pep8-indent'

Plug 'https://github.com/dense-analysis/ale'

Plug 'https://github.com/davidhalter/jedi'
call plug#end()

au BufNewFile,BufRead *.py \
   set foldmethod=indent

nnoremap <space> za

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1



function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

