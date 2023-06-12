# internet 
choco install firefox --params "/NoDesktopShortcut /NoAutoUpdate" -y
choco install thunderbird --params "/NoDesktopShortcut /NoAutoUpdate" -y

#Cloud
choco install dropbox -y
choco install megasync -y
choco install pcloud -y

# tools
choco install 7zip.install --params "/NoContextMenu" -y
choco install freefilesync -y

# choco install totalcommander --params '/NoDesktopIcon' -y
choco install doublecmd --params "/NoDesktopIcon" -y
choco install dupeguru -y
choco install winscp -y
choco install powertoys -y
choco install bulk-crap-uninstaller -y
choco install monitorian -y
choco install sharex -y

# development
choco install notepadplusplus  -y
choco install git --version -y
choco install gitextensions.portable -y
choco install vscode -y
choco install powershell-core - --install-arguments='"DISABLE_TELEMETRY=1"' -y

# IDEs
choco install intellijidea-community -y
choco install androidstudio -y

# java
choco install temurin17 -y <# LTS SDK #>
choco install temurin8 -y <# java 8 SDK #>
choco install temurin -y <# Latest SDK #>







