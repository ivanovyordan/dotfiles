function __tmate_pair_get_url
  set url (tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')
  echo $url | tr -d '\n' | pbcopy
  echo "Copied tmate url for $TMATE_PAIR_NAME:"
  echo $url
end

function __tmate_pair_start_session
  echo "start start sesson"
  env TMUX='' tmate -S $TMATE_SOCKET_LOCATION -f $HOME/.tmate.conf new-session -d -s $TMATE_PAIR_NAME
  echo "end start sesson"
end

function __tmate_pair_wait_for_url
  echo "start wait url"
  while [ ! set -q $url ]
    set url (tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')
  end

  __tmate_pair_get_url
  sleep 1
  echo "end wait url"
end

function __tmate_pair_set_set_session_name
  echo "start sesion name"
  echo $argv
  test (count $argv) -gt 0 \
  ;and echo $argv[1] > $TMATE_TMUX_SESSION tmate -S $TMATE_SOCKET_LOCATION \
      send -t $TMATE_PAIR_NAME "env TMUX='' tmux attach-session -t $argv[1]" ENTER
      echo "end sesion name"
end

function __tmate_pair_attach
  echo "start attach"
  tmate -S $TMATE_SOCKET_LOCATION attach-session -t $TMATE_PAIR_NAME
  echo "start attach"
end

function pair
  echo "start pair"
  ! test -e $TMATE_SOCKET_LOCATION \
  ;and __tmate_pair_start_session \
  ;and __tmate_pair_wait_for_url \
  ;and __tmate_pair_set_set_session_name $argv[1]

  __tmate_pair_attach

  echo "end pair"
end
