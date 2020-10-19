#!/bin/bash -e
systemctl --user stop tasky-api.service 
systemctl --user stop tasky.service 

function cleanup { 
    echo "Closing down..."
    systemctl --user stop tasky-api.service 
    systemctl --user stop tasky.service 
    systemctl --user status tasky-api.service 
    export RUST_LOG=none
} 

export RUST_LOG=error

# This will run cleanup when we exit
trap cleanup EXIT 

systemctl --user start tasky-api.service 
systemctl --user start tasky.service 

# This starts tasky for the working day and sigkills after the time period
sleep 8h
journalctl -u tasky-api.service