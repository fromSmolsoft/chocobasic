Add-Type -AssemblyName System.Windows.Forms

# Create a new form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Chocolatey Install"
$form.Width = 400
$form.Height = 400
$form.FormBorderStyle = 'Sizable'
$form.MaximizeBox = $true
$form.AutoScroll = $true

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.AutoSize = $true  # Adjusted to enable label resizing
$label.Text = "Select packages to install:"
$form.Controls.Add($label)

# Create checkboxes dynamically based on the content of the script
$checkBoxes = @()
# $packages = @{}
# $currentCategory = ""

$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "..\chocolatey_install_all.ps1"  # Set the correct relative path to the base script

# Read the content of the base script
$scriptContent = Get-Content -Path $scriptPath

# Parse the content and extract package names and categories
$groupLabels = $scriptContent | Select-String -Pattern "^##\s(.+)" | ForEach-Object { $_.Matches.Groups[1].Value }

$currentY = 50
$checkBoxWidth = $form.ClientSize.Width - 60  # Adjusted width based on form width
$groupPackages = @{}
foreach ($groupLabel in $groupLabels) {
    # Initialize packages array for the group label
    $groupPackages[$groupLabel] = @()

}

foreach ($line in $scriptContent) {
    if ($line -match "^##\s(.+)$") {
        $currentCategory = $matches[1]
    } elseif ($line -match "choco install ([^\s]+)") {
        $packageName = $matches[1]
        $groupPackages[$currentCategory] += $packageName
    }
}

foreach ($groupLabel in $groupLabels) {
    # Add category label
    $currentY += 30
    $categoryLabel = New-Object System.Windows.Forms.Label
    $categoryLabel.Location = New-Object System.Drawing.Point(20, $currentY)
    $categoryLabel.AutoSize = $true  # Adjusted to enable label resizing
    $categoryLabel.Text = $groupLabel
    $form.Controls.Add($categoryLabel)

    # Find corresponding packages for the group label
    $groupPackages[$groupLabel] | ForEach-Object {
        $currentY += 25
        $checkBox = New-Object System.Windows.Forms.CheckBox
        $checkBox.Location = New-Object System.Drawing.Point(40, $currentY)
        $checkBox.Size = New-Object System.Drawing.Size($checkBoxWidth, 20)  # Adjusted size based on form width
        $checkBox.Text = $_
        $checkBoxes += $checkBox
        $form.Controls.Add($checkBox)
    }
}



# Create the "OK" button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point([int](($form.ClientSize.Width - $okButton.Width) / 2), [int]($currentY + 40))

$okButton.Size = New-Object System.Drawing.Size(75, 23)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

# Subscribe to the form's Resize event
$form.add_Resize({
    $label.Width = $form.ClientSize.Width - 20
    $checkBoxWidth = $form.ClientSize.Width - 60
    foreach ($checkBox in $checkBoxes) {
        $checkBox.Location = New-Object System.Drawing.Point(40, $checkBox.Location.Y)
        $checkBox.Width = $checkBoxWidth
    }
    $okButton.Location = New-Object System.Drawing.Point([int](($form.ClientSize.Width - $okButton.Width) / 2), [int]($currentY + 40))
})

# Show the form and handle the result
$result = $form.ShowDialog()

# Process the selected checkboxes
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $selectedPackages = @()
    foreach ($checkBox in $checkBoxes) {
        if ($checkBox.Checked) {
            $selectedPackages += $checkBox.Text
        }
    }

    # Install selected packages using Chocolatey
    foreach ($package in $selectedPackages) {
        Write-Host "Installing package: $package"
        choco install $package -y
    }
}

# Dispose the form
$form.Dispose()