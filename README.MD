# chocobasic

Simple powershell UI utility that can dynamically read chocolatey install scripts.

### How to use

1. insert you own chocolatey install scripts into `*.ps1` in root directory
2. run `ui/form.ps1` in PowerShell as admin
3. check checkboxes
4. click ok

`ui/form.ps1` will read this file in following way

- `##` creates group label e.g. `## internet` > `internet` label above checkboxes in UI
- choco install ... marks command to be executed and command will be shown next to its own checkbox
