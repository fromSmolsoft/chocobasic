Add-Type -AssemblyName System.Windows.Forms

# Create a new form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Chocolatey Install"
$form.Size = New-Object System.Drawing.Size(300, 400)
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.Size = New-Object System.Drawing.Size(280, 20)
$label.Text = "Select packages to install:"
$form.Controls.Add($label)

# Create checkboxes dynamically based on the content of the script
$checkBoxes = @()
$packages = @{}
$currentCategory = ""

$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "..\chocolatey_install_all.ps1"  # Set the correct relative path to the base script

# Read the content of the base script
$scriptContent = Get-Content -Path $scriptPath

# Parse the content and extract package names and categories
foreach ($line in $scriptContent) {
    if ($line -match "^# (.+)$") {
        $currentCategory = $matches[1]
    } elseif ($line -match "choco install ([^\s]+)") {
        $packageName = $matches[1]
        $packages[$packageName] = $currentCategory
    }
}

$currentY = 50
foreach ($package in $packages.GetEnumerator() | Sort-Object -Property Value) {
    $packageName = $package.Key
    $category = $package.Value

    # Add category label if it's a new category
    if ($category -ne $currentCategory) {
        $currentY += 30
        $categoryLabel = New-Object System.Windows.Forms.Label
        $categoryLabel.Location = New-Object System.Drawing.Point(20, $currentY)
        $categoryLabel.Size = New-Object System.Drawing.Size(260, 20)
        $categoryLabel.Text = $category
        $form.Controls.Add($categoryLabel)

        $currentCategory = $category
    }

    # Create checkbox for each package
    $currentY += 25
    $checkBox = New-Object System.Windows.Forms.CheckBox
    $checkBox.Location = New-Object System.Drawing.Point(40, $currentY)
    $checkBox.Text = $packageName
    $checkBoxes += $checkBox
    $form.Controls.Add($checkBox)
}

# Create the "OK" button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(100, 350)
$okButton.Size = New-Object System.Drawing.Size(75, 23)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

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