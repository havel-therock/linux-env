if [ -z "$TMUX" ] && [[ "$TERM" != "linux" ]]; then
tmux && exit
fi
