let g:ycm_java_jdtls_extension_path = [
      \ expand( '<sfile>:p:h:h:h:h:h' ) . '/gadgets/macos'
      \ ]

let s:jdt_ls_debugger_port = 0
let s:mainclass = ''
function! s:StartDebugging()
  let s:path = expand('%:p')
  let s:end = stridx(s:path, '.java')
  let s:begin = stridx(s:path, '/main/java/')
  let s:mainclass = substitute(strpart(s:path, s:begin+ 11, s:end - s:begin -11), "/", ".", "g") 
  
  if s:jdt_ls_debugger_port <= 0
    " Get the DAP port
    let s:jdt_ls_debugger_port = youcompleteme#GetCommandResponse(
      \ 'ExecuteCommand',
      \ 'vscode.java.startDebugSession' )

    if s:jdt_ls_debugger_port == ''
       echom 'Unable to get DAP port - is YCM initialized?'
       let s:jdt_ls_debugger_port = 0
       return
     endif
  endif

  " Start debugging with the DAP port
  call vimspector#LaunchWithSettings( { 
        \'DAPPort': s:jdt_ls_debugger_port,
        \'mainClass': s:mainclass
        \} )

endfunction

nnoremap <silent> <buffer> <Leader><F5> :call <SID>StartDebugging()<CR>
