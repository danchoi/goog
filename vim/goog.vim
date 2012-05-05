syntax region h1  start="^\d\+\."       end="\($\)" 
syntax region href  start="^http:"     end="\($\)" 
highlight link h1     Identifier
highlight link href   Constant
hi Identifier	term=NONE cterm=NONE gui=NONE ctermfg=LightCyan
hi Constant  term=NONE cterm=NONE  gui=NONE ctermfg=Magenta

let s:http_link_pattern = 'https\?:[^ >)\]]\+'
let g:browser_command = system("echo -n $(which gnome-open || which open)")
func! s:open_href_under_cursor()
  let res = search(s:http_link_pattern, 'cw')
  if res != 0
    let href = matchstr(expand("<cWORD>") , s:http_link_pattern)
    let command = g:browser_command . " '" . shellescape(href) . "' "
    echom command
    call system(command)
  end
endfunc

nnoremap <leader>o :call <SID>open_href_under_cursor()<CR>

" http://www.padrinorb.com/pages/why
