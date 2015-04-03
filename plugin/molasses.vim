let s:wait = get(g:, 'molasses_wait', 200) * 1000
if !s:wait " We're installed, but the user is stuck in their old ways.
  finish
end

let s:prev = {}

function! s:Molasses(key)
  if v:count
    return a:key
  end

  " Special keys such as <Up> and <BS>, regardless of how they are specified,
  " get passed into this function as their termcap variants (see :help t_ku).
  " As such, the s:prev dictionary cannot be pre-populated upon initialization
  " without the heavy-handed inelegance of hard-coding the translation map.
  if !has_key(s:prev, a:key)
    let s:prev[a:key] = reltime()
    return a:key
  endif

  let t = reltime(s:prev[a:key])
  if t[0] * 1000000 + t[1] < s:wait
    return ''
  endif

  let s:prev[a:key] = reltime()
  return a:key
endfunction

let s:keys = get(g:, 'molasses_keys', 'hjkl')

for s:i in range(len(s:keys))
  exec 'nmap <expr>' . s:keys[s:i] . ' <SID>Molasses("' . s:keys[s:i] . '")'
endfor
