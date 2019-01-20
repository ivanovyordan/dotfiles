function highlight_item
  set file (echo $argv[1] | awk -F: '{print $1}')
  set start_line (echo $argv[1] | awk -F: '{print $2}')
  test -n $start_line ;or set start_line 1

  # It's a directory
  if test -d $file
    tree -C $file
    exit 0
  end

  # It's a binary file
  if string match -r \"binary\\\$\" (file --mime {})
    echo "$file is a binary file"
    exit 0
  end

  # It's a text file and we have installed bat
  if command --search bat >/dev/null
    bat --style=numbers --color=always -r $start_line: $file
    exit 0
  end

  # It's a text file and we have installed highlight
  if command --search highlight >/dev/null
    highlight -O ansi -m $start_line --failsafe $file
    exit 0
  end

  # It's a text file and we don't have any of the supported highlighting tools
  cat $file
end
