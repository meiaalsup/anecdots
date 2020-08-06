alias mosh='mosh -6'
mdev() {
  mosh -6 $1 -- tmux a
}
