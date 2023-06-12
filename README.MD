# chocobasic

Simple powershell UI utility that can read chocolatey install scripts

### How to use

1. run `ui/form.ps1` in PowerShell as admin
2. check checkboxes
3. click ok

`*.ps1` file in root directory includes install scripts and comments with double `#`  
`ui/form.ps1` will read this file in following way

- `##` marks group label e.g. `## internet` > `internet` label in UI
- choco install ... marks command to be executed
