function __tmate_pair_start_session
  set -e TMUX
  tmate -S $TMATE_SOCKET_LOCATION -f $HOME/.dotfiles/config/tmux/tmate.conf new-session -d -s $TMATE_PAIR_NAME
end

function __tmate_pair_set_set_session_name
  echo $argv

  test (count $argv) -gt 0 ;and \
  echo $argv[1] > $TMATE_TMUX_SESSION tmate -S $TMATE_SOCKET_LOCATION \
    send -t $TMATE_PAIR_NAME "env TMUX='' tmux attach-session -t $argv[1]" ENTER
end

function __tmate_pair_attach
  set -e TMUX
  tmate -S $TMATE_SOCKET_LOCATION attach-session -t $TMATE_PAIR_NAME
end

function pair
  set -gx TMATE_PAIR_NAME (whoami)-pair
  set -gx TMATE_SOCKET_LOCATION "/tmp/tmate-pair.sock"
  set -gx TMATE_TMUX_SESSION "/tmp/tmate-tmux-session"

  ! test -e $TMATE_SOCKET_LOCATION ;and \
  __tmate_pair_start_session ;and \
  __tmate_pair_set_set_session_name

  __tmate_pair_attach
end
