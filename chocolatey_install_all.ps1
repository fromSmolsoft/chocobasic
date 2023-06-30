## internet 
choco install firefox --params "/NoDesktopShortcut /NoAutoUpdate" -y
choco install thunderbird --params "/NoDesktopShortcut /NoAutoUpdate" -y

## social
choco install signal --params "/NoAutoUpdate /NoShortcut" -y

## cloud
choco install dropbox -y
choco install megasync -y
choco install pcloud -y

## data management
choco install 7zip.install --params "/NoContextMenu" -y
# choco install freefilesync -y
# choco install totalcommander --params '/NoDesktopIcon' -y
choco install doublecmd --params "/NoDesktopIcon" -y
choco install dropit.portable
# choco install dropit.install
choco install dupeguru -y

choco install winscp -y
choco install filezilla -y

## tools
choco install powertoys -y
choco install bulk-crap-uninstaller -y
choco install monitorian -y
choco install sharex -y
# choco install hwinfo -y
choco install hwinfo.portable -y

## office
choco install libreoffice-fresh -y

## media
choco install vlc -y
choco install audacious -y

## media editor
choco install audacity -y

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







