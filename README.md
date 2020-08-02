# Configs-Macros-Dotfiles

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Compendium of configuration files, macros and dotfiles for some programs I use.

## Table of contents

1. [Windows](#Windows-Configs)

   1. [Windows terminal](#Windows-Terminal)

2. [Cross Platform](#Cross-Platform)
   1. [Visual Studio Code](#Visual-Studio-Code)

## Windows Configs

### [Windows Terminal](https://github.com/ALK222/Configs-Macros-Dotfiles/tree/master/Windows-Terminal)

This config jason will change some parameter of the new [Windows Terminal](https://github.com/microsoft/terminal). It will change to the [Dracula color scheme](https://draculatheme.com/windows-terminal/) with a minor change (cursor will be pink)

```json
{
  //rest of the theme
  "cursorColor": "#FF79C6"
}
```

Add a custom profile to the terminal that points to a custom code folder where all my code is stored.

```json
{
  //Directly to the code folder
  "guid": "{47c1f1b1-9926-4cba-b4fb-c7a5f2467903}",
  "name": "Code PowerShell",
  "hidden": false,
  "commandline": "powershell.exe",
  //Change this to the code directory
  "startingDirectory": "C:\\Users\\alex_\\Documents\\code",
  //this icon can be changet to your own by setting an URL or a image in your computer
  "icon": "https://avatars1.githubusercontent.com/u/44205191?s=400&u=7e085d01339ce2978d4662b6bb17a21c1060c6a8&v=4"
}
```

For the default configs I use the vintage cursor and acrylic background with no scrollbar

```json
{
  "defaults": {
    // Put settings here that you want to apply to all profiles.
    "colorScheme": "Dracula",
    "cursorShape": "vintage",
    "experimental.retroTerminalEffect": false,
    "scrollbarState": "hidden",
    "useAcrylic": true,
    "acrylicOpacity": 0.7
  }
}
```

### [Corsair iCUE](https://github.com/ALK222/Configs-Macros-Dotfiles/tree/master/iCUE-Profiles)

RGB profiles for [Corsair iCUE](https://www.corsair.com/es/es/icue) for K95 Platinum keyboard, Glaive RGB mouse and Void Pro RGB headset.

## Cross Platform

### [Visual Studio Code](https://github.com/ALK222/Configs-Macros-Dotfiles/tree/master/VSCode-Settings)

Config file for [Visual Studio Code](https://github.com/microsoft/vscode), using the [Dracula color scheme](https://draculatheme.com/visual-studio-code) with a change for the acttivity bar, [matherial icon theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) and the [IBM 3270 font](https://github.com/rbanffy/3270font)

```json
{
  "workbench.colorCustomizations": {
    "activityBar.foreground": "#ff79c6"
  }
}
```

This settings include settings for LaTeX, Java and Python
