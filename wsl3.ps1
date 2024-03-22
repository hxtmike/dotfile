# if wanna run this script
# the script has to be run in the terminal/powershell
    # as "administrator" and,
    # in the directory of the script
# when two requirements fullfiled, run command 'powershell -ExecutionPolicy Bypass -File "./wsl3.ps1"'

Write-Output 'test'

if (-not (Test-Path -Path "$env:APPDATA\Code\User")) {
    New-Item -ItemType Directory -Path "$env:APPDATA\Code\User" | Out-Null
}

if (Test-Path "$env:APPDATA\Code\User\settings.json") {
    Remove-Item "$env:APPDATA\Code\User\settings.json" -Force
    # echo $env:APPDATA\Code\User\settings.json
}

if (Test-Path "$env:APPDATA\Code\User\keybindings.json") {
    Remove-Item "$env:APPDATA\Code\User\keybindings.json" -Force
    # echo $env:APPDATA\Code\User\settings.json
}

New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Code\User\settings.json" -Target "$PWD\vscode\settings.json" 
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Code\User\keybindings.json" -Target "$PWD\vscode\keybindings.json"

# Read-Host -Prompt "Press Enter to exit"