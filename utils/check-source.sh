#!/bin/bash

bashrc_file="$HOME/.bashrc"
source_line="source /etc/profile"

# 检查 $HOME/.bashrc 是否存在 source /etc/profile
if ! grep -q "$source_line" "$bashrc_file"; then
    echo "$source_line" >> "$bashrc_file"
    echo "Added 'source /etc/profile' to $bashrc_file"
else
    echo "The line 'source /etc/profile' already exists in $bashrc_file"
fi