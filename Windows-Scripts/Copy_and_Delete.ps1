#Sets a backup of VsCode snippets and configuration and deletes all files in temporal folders

Copy-Item -Path  "C:\Users\alex_\AppData\Roaming\Code\User\*" -Destination ".\VSCode" -Recurse -Exclude "globalStorage" "WorkspaceStorage" -Force

Remove-Item -Path "C:\Users\alex_\AppData\Local\Temp" -Recurse
Remove-Item -Path "C:\Windows\Temp" -Recurse
