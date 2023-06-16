## internet 
choco install firefox --params "/NoDesktopShortcut /NoAutoUpdate" -y
choco install thunderbird --params "/NoDesktopShortcut /NoAutoUpdate" -y

## cloud
choco install dropbox -y
choco install megasync -y
choco install pcloud -y

## tools
choco install 7zip.install --params "/NoContextMenu" -y
# choco install freefilesync -y
# choco install totalcommander --params '/NoDesktopIcon' -y
choco install doublecmd --params "/NoDesktopIcon" -y
choco install dupeguru -y
choco install winscp -y

choco install powertoys -y
choco install bulk-crap-uninstaller -y
choco install monitorian -y
choco install sharex -y

## development
choco install git --params "'/NoShellIntegration /WindowsTerminalProfile /DefaultBranchName:main'" -y
choco install gitextensions -y
choco install powershell-core - --install-arguments='"DISABLE_TELEMETRY=1"' -y

## IDEs & editors
choco install notepadplusplus  -y
choco install vscode --params "/NoDesktopIcon /NoContextMenuFiles /NoContextMenuFolders" -y
choco install intellijidea-community -y
choco install androidstudio -y --package-parameters="/PinToTaskbar"

## java
choco install temurin17 -y --params "/INSTALLDIR=$env:Program Files\Java\temurin17 /quiet\ " <# LTS SDK #>
choco install temurin8 -y --params "/INSTALLDIR=$env:Program Files\Java\temurin8\ /quiet" <# java 8 SDK #>
choco install temurin -y --params "/INSTALLDIR=$env:Program Files\Java\temurin\ /quiet" <# Latest SDK #>







