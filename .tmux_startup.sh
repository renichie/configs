#!/bin/bash
session="zax"
window0="workspace"
window1="zambe-test_log"
window2="zambe_log"

tmux start-server
tmux new-session -s $session -n $window0\; \
	split-window -h \; \
	split-window -v \; \
	select-pane -t 0 \; \
	new-window -n $window1 \; select-window -t $window1 \; send-keys "docker logs -t -f zambe-test" C-m \; \
	new-window -n $window2 \; select-window -t $window2 \; send-keys "docker logs -t -f zambe" C-m \; \
	select-window -t $window0 \; select-pane -t 1 \; send-keys "ls" C-m \; \
	select-window -t $window0 \; select-pane -t 2 \; send-keys "echo \"hier koennte ihr befehl stehen\"" C-m \; \
	select-window -t $window0 \; select-pane -t 0 \;
