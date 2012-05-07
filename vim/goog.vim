syntax region h1  start="^\d\+\."       end="\($\)" 
syntax region href  start="^https\?:"     end="\($\)" 
highlight link h1     Identifier
highlight link href   Constant
hi Identifier	term=NONE cterm=NONE gui=NONE ctermfg=LightCyan
hi Constant  term=NONE cterm=NONE  gui=NONE ctermfg=Magenta

let s:http_link_pattern = '^https\?:[^ >)\]]\+'

let g:gui_web_browser = system("echo -n $(which gnome-open || which open)")
if ! exists("g:text_web_browser")
  if executable("elinks") 
    let  g:text_web_browser = 'elinks -dump -no-numbering'
  elseif executable("lynx")
    let  g:text_web_browser = 'lynx -dump -nonumbers'
  elseif executable("links") 
    let  g:text_web_browser = 'links -dump'
  endif
end


let s:web_page_bufname = "GoogBrowser"

func! s:open_href_under_cursor(text_browser)
  let res = search(s:http_link_pattern, 'cw')
  if res != 0
    let href = matchstr(expand("<cWORD>") , s:http_link_pattern)
    if a:text_browser == 0
      let command = g:gui_web_browser . " " . shellescape(href) . " "
      call system(command)
    else
      let command = g:text_web_browser . ' ' .  shellescape(href) . " "
      echom command
      let result = system(command)
      if bufexists(s:web_page_bufname) && bufwinnr(s:web_page_bufname) != -1
        exec bufwinnr(s:web_page_bufname)."wincmd "    
      else
        exec "vsplit ".s:web_page_bufname
      endif
      silent! put! =result
      silent! 1put! ='URL: '.href 
      silent! 2put! =''
      setlocal buftype=nofile 
      normal 1G
    endif
  end
endfunc

func! s:find_next_link(backward)
  let n = 0
  " don't wrap
  if a:backward == 1 
    normal lb
    let result = search(s:http_link_pattern, 'Wb') 
  else
    let result = search(s:http_link_pattern, 'W')
  endif
  if (result == 0) 
    return ""
  end
  return 
endfunc


nnoremap <leader>o :call <SID>open_href_under_cursor(0)<CR>
nnoremap <leader>O :call <SID>open_href_under_cursor(1)<CR>
noremap <buffer> <c-j> :call <SID>find_next_link(0)<CR>
noremap <buffer> <c-k> :call <SID>find_next_link(1)<CR>

" http://www.padrinorb.com/pages/why
