function copy
  if contains Darwin (uname)
    pbcopy
  else
    xclip -in -selection clipboard
  end
end
