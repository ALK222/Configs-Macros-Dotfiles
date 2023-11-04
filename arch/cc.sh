#!/bin/bash

# Read JSON file
json_file="config.json"
dotfiles_folder="dotfiles"

# Check if the JSON file exists
if [ -f "$json_file" ]; then
    # Read JSON and remove existing contents in dotfiles folder
    rm -rf "$dotfiles_folder"

    # Create dotfiles folder
    mkdir -p "$dotfiles_folder"

    # Read JSON and copy files/folders
    cat "$json_file" | jq -c '.configs[]' | while IFS= read -r line; do
        app_name=$(jq -r '.app_name' <<< "$line")
        source_path=$(eval echo $(jq -r '.source_path' <<< "$line"))
        is_folder=$(jq -r '.is_folder' <<< "$line")
        
        if [ -n "$app_name" ] && [ -n "$source_path" ]; then
            # Copy the file or folder to dotfiles folder
            if [ "$is_folder" == "true" ]; then
                # Copy entire folder
                cp -r "$source_path" "$dotfiles_folder/$app_name"
            else
                # Copy single file
                cp "$source_path" "$dotfiles_folder/$app_name"
            fi
            echo "Copied $source_path for $app_name to $dotfiles_folder/$app_name"
        else
            echo "Invalid JSON format: $line"
        fi
    done
else
    echo "JSON file '$json_file' not found."
fi
