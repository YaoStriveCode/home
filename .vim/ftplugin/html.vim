" This is a wrapper script to add extra html support to xml documents.
" Original script can be seen in xml-plugin documentation.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.

let b:html_mode = 1

if !exists("*HtmlAttribCallback")
function HtmlAttribCallback( xml_tag )
  if a:xml_tag ==? "form"
    return "name=\"\" method=\"\" action\"\""
  elseif a:xml_tag ==? "label"
    return "for=\"\""
  elseif a:xml_tag ==? "input"
    return "id=\"\" name=\"\" type=\"\" value=\"\""
  elseif a:xml_tag ==? "textarea"
    return "id=\"\" name=\"\" rows=\"\" cols=\"\""
  elseif a:xml_tag ==? "table"
    return "cellpadding=\"0\" cellspacing=\"0\" border=\"0\""
  elseif a:xml_tag ==? "link"
    return "href=\"\" rel=\"stylesheet\" type=\"text/css\""
  elseif a:xml_tag ==? "img"
    return "src=\"\" width=\"0\" height=\"0\" border=\"0\" alt=\"\""
  else
    return 0
  endif
endfunction
endif

" On to loading xml.vim
runtime ftplugin/xml.vim
