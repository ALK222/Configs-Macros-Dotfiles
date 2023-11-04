#!/bin/bash

# Read JSON file
json_file="config.json"
dotfiles_folder="dotfiles"

# Check if the JSON file exists
if [ -f "$json_file" ]; then
    # Read JSON and copy files/folders back to original paths
    cat "$json_file" | jq -c '.configs[]' | while IFS= read -r line; do
        app_name=$(jq -r '.app_name' <<< "$line")
        source_path=$(eval echo $(jq -r '.source_path' <<< "$line"))
        is_folder=$(jq -r '.is_folder' <<< "$line")
        
        if [ -n "$app_name" ] && [ -n "$source_path" ]; then
            # Check if the source path exists in dotfiles folder
            if [ -e "$dotfiles_folder/$app_name" ]; then
                # Remove existing content in the target folder
                rm -rf "$source_path"
                
                # Copy the file or folder back to its original path
                if [ "$is_folder" == "true" ]; then
                    # Copy entire folder
                    cp -r "$dotfiles_folder/$app_name" "$source_path"
                else
                    # Copy single file
                    cp "$dotfiles_folder/$app_name" "$source_path"
                fi
                echo "Restored $dotfiles_folder/$app_name to $source_path for $app_name"
            else
                echo "Folder/file not found in dotfiles: $app_name"
            fi
        else
            echo "Invalid JSON format: $line"
        fi
    done
else
    echo "JSON file '$json_file' not found."
fi
