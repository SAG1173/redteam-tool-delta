#!/bin/bash

# List of fake process names
process_names=("sshd" "httpd" "nginx" "kworker" "syslogd")

# Function to spawn a renamed process
spawn_process() {
    # Choose a random fake name
    name=${process_names[$((RANDOM % ${#process_names[@]}))]}
    # Start the process with a renamed title
    exec -a "$name" sleep 1000 &
}

# Loop to spawn multiple renamed processes
for i in {1..10}; do
    spawn_process
    sleep $((RANDOM % 10 + 1))  # Random delay between each spawn
done
