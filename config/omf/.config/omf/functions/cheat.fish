function cheat --description "cheat <language> <question>"
  set lang $argv[1]
  set --erase argv[1]
  set question (string join '+' $argv)

  http https://cheat.sh/$lang/$question
end
