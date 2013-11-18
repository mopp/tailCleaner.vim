" Author: mopp

if exists('g:loaded_tailCleaner')
    finish
endif
let g:loaded_tailCleaner = 1

let s:save_cpo = &cpo
set cpo&vim

" 行末の空白を削除
" TODO: ファイルタイプの任意設定
"     : 空白以外の削除
function! s:remove_tail_space()
    if &filetype == 'markdown'
        return
    endif

    let c = getpos('.')
    g/.*\s$/normal $gelD
    call setpos('.', c)
endfunction


augroup tailCleaner
    autocmd!
    " 書き込み時に行末の空白を削除
    autocmd BufWritePre * silent call s:remove_tail_space()
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo

