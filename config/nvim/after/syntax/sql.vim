let saved_syntax = b:current_syntax
unlet! b:current_syntax
syntax include @js syntax/javascript.vim
let b:current_syntax = saved_syntax
unlet! saved_syntax

syntax region sqlSnippet start="$$" end="$$" contains=@js
