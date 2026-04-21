#!/bin/bash

# Define the name of your session
SESSION="system_monitor_session"

# Check if the session already exists. If not, create it.
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # 1. Create a new detached session (-d) named $SESSION
  # This creates Window 0, Pane 0 (which takes up the whole screen initially)
  tmux new-session -d -s $SESSION

  # 2. Split the screen horizontally (-h) into left and right halves.
  # This creates Pane 1 on the right. Focus automatically shifts to Pane 1.
  tmux split-window -h -t $SESSION

  # 3. Split the right side vertically (-v) into top and bottom.
  # This creates Pane 2 on the bottom right. Focus shifts to Pane 2.
  tmux split-window -v -t $SESSION

  # 4. Send commands to each specific pane.
  # "C-m" simulates pressing the 'Enter' key.

  # Send to Pane 0 (Left Half)
  # tmux send-keys -t $SESSION:0.0 './script_left.sh' C-m

  # Send to Pane 1 (Top Right Half)
  tmux send-keys -t $SESSION:0.1 'sudo asitop' C-m

  # Send to Pane 2 (Bottom Right Half)
  tmux send-keys -t $SESSION:0.2 'htop' C-m
		
  # Focus the top right pane (Pane 1) because we need to type in password
  tmux select-pane -t $SESSION:0.1
fi

# 5. Attach your terminal to the newly created session
tmux attach-session -t $SESSION
