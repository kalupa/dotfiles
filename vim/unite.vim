let g:unite_source_file_rec_max_cache_files = 0
let g:unite_split_rule = 'botright'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

call unite#custom#source('buffer,file,file_rec/git', 'sorters', 'sorter_selecta')
call unite#custom#source('file,file_rec/git','max_candidates', 0)
call unite#custom#source(
      \ 'file,buffer,file_rec/git','matchers',
      \ [ 'matcher_fuzzy', 'matcher_hide_current_file' ])

" unite searching stuff
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--nocolor --nogroup --hidden --ignore-dir vendor/cache --ignore-dir .git --ignore *.log --ignore *.bundle.* --ignore-dir .jhw-cache'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
        \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

function! s:unite_my_settings()
  " Overwrite settings.
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

autocmd FileType unite call s:unite_my_settings()

nnoremap <silent> <C-p> :Unite -start-insert -no-split -buffer-name=files -winheight=10 -prompt-direction=top file_rec/git file_mru<CR>
nnoremap <Leader>p :Unite -start-insert -no-split -buffer-name=files -winheight=10 -prompt-direction=top file_rec/git file_mru<CR>
nnoremap <Leader>l :Unite -start-insert -buffer-name=lines line -prompt-direction=top<CR>
nnoremap <Leader>b :Unite -start-insert -buffer-name=buffers buffer -prompt-direction=top<CR>
nnoremap <Leader>f :Unite grep:. -prompt-direction=top<CR>
