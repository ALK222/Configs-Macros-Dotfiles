#!/usr/bin/env bash
sleep 0.5
pipe_type=$((1 + RANDOM % 9))
cmds=( "cbonsai -i -l" "cmatrix" "asciiquarium" "pipes.sh -t ${pipe_type}")
i=$(( RANDOM % ${#cmds[@]} ))

${cmds[i]}