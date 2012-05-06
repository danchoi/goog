syntax region h1  start="^\d\+\."       end="\($\)" 
syntax region href  start="^https\?:"     end="\($\)" 
highlight link h1     Identifier
highlight link href   Constant
hi Identifier	term=NONE cterm=NONE gui=NONE ctermfg=LightCyan
hi Constant  term=NONE cterm=NONE  gui=NONE ctermfg=Magenta

let s:http_link_pattern = 'https\?:[^ >)\]]\+'

let g:gui_web_browser = system("echo -n $(which gnome-open || which open)")
let g:text_web_browser = system("echo -n $(which elinks || which links || which lynx)")

func! s:open_href_under_cursor(text_browser)
  let res = search(s:http_link_pattern, 'cw')
  if res != 0
    let href = matchstr(expand("<cWORD>") , s:http_link_pattern)
    if a:text_browser == 0
      let command = g:gui_web_browser . " " . shellescape(href) . " "
      call system(command)
    else
      let command = g:text_web_browser . " --dump  " . shellescape(href) . " "
      echom command
      let result = system(command)
      new WebPage
      silent! put! =result
      setlocal buftype=nofile 
      normal 1G
    endif
  end
endfunc

nnoremap <leader>o :call <SID>open_href_under_cursor(0)<CR>
nnoremap <leader>O :call <SID>open_href_under_cursor(1)<CR>

" http://www.padrinorb.com/pages/why
