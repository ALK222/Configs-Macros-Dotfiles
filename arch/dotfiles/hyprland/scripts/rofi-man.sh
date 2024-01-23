#!/bin/bash

# Define the themes for each rofi instance
java_theme=~/.config/rofi/themes/sidetab-big.rasi
man_theme=~/.config/rofi/themes/sidetab.rasi
hoogle_theme=~/.config/rofi/themes/sidetab-big.rasi

# Use rofi to choose between JavaDocs and man pages
selected_option=$(echo -e "JavaDocs\nMan Pages\nHoogle" | rofi -dmenu -p "Choose Option" -theme $man_theme)

case "$selected_option" in
    "JavaDocs")
        # Define the JavaDocs directory
        javadoc_directory="/usr/share/doc/java-openjdk/api/"
        
        # Use find to locate HTML files in the JavaDocs directory
        selected_javadoc=$(find "$javadoc_directory" -type f -name '*.html' -readable | cut -d '/' -f 7- | sed 's/\.html$//' | rofi -dmenu -p "Choose JavaDoc" -theme $java_theme)
        
        # Check if a JavaDoc was selected
        if [ -n "$selected_javadoc" ]; then
            firefox $javadoc_directory$selected_javadoc.html
        fi
    ;;
    "Man Pages")
        # Define the command to search man pages
        selected_man=$(man -k . | awk '{print $1 $2}' | rofi -dmenu -i -p "Search man pages" -theme $man_theme)
        
        # Check if a man page was selected
        if [ -n "$selected_man" ]; then
            name=$(echo "$selected_man" | awk -F '(' '{print $1}')
            section=$(echo "$selected_man" | awk -F '(' '{print $2}' | cut -c1-1)
            alacritty -e sh -c "man $section $name;"
        fi
    ;;
    "Hoogle")
        # Use rofi to enter the Hoogle search query
        hoogle_query=$(rofi -dmenu -p "Hoogle Search" -theme $hoogle_theme)
        
        # Check if a Hoogle search query was entered
        if [ -n "$hoogle_query" ]; then
            # Run the Hoogle search and display results in rofi
            hoogle_results=$(hoogle "$hoogle_query" -n 100000 | rofi -dmenu -p "Hoogle Results" -theme $hoogle_theme)
            
            # Check if a Hoogle result was selected
            if [ -n "$hoogle_results" ]; then
                # You can adjust the command based on the Hoogle result selected
                alacritty -e sh -c "hoogle $hoogle_results"
            fi
        fi
    ;;
    *)
        # User canceled or closed rofi
        exit 1
    ;;
esac
