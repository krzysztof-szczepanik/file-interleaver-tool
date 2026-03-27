Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing






# =========================== FUNCTIONS ============================

function Update-StartButton {
    if ([string]::IsNullOrWhiteSpace($folder_text_box.Text) -or
        [string]::IsNullOrWhiteSpace($special_file_text_box.Text)) {

        $start_button.Enabled = $false
    } else {
        $start_button.Enabled = $true
    }
}






# ============================ GLOBALS =============================

$script:pythonProcess = $null
$font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$folder = New-Object System.Windows.Forms.FolderBrowserDialog
$special_file = New-Object System.Windows.Forms.OpenFileDialog
$special_folder = New-Object System.Windows.Forms.FolderBrowserDialog
$labels_break = 10






# ========================== MAIN CONTROLS ==========================

# Folder label, text box, and selection button:
$folder_label = New-Object System.Windows.Forms.Label
$folder_label.Location = New-Object System.Drawing.Size(25, 25)
$folder_label.Width = 70
$folder_label.Height = 25
$folder_label.Text = "Folder:"
$folder_label.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$folder_label.Font = $font

$folder_text_box = New-Object System.Windows.Forms.Label
$folder_text_box.Location = New-Object System.Drawing.Size((($folder_label.Location.X + $folder_label.Size.Width) + $labels_break), 25)
$folder_text_box.Width = 550
$folder_text_box.Height = 25
$folder_text_box.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$folder_text_box.Font = $font
$folder_text_box.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$folder_choice_button = New-Object System.Windows.Forms.Button
$folder_choice_button.Location = New-Object System.Drawing.Size((($folder_text_box.Location.X + $folder_text_box.Size.Width) + $labels_break), 25)
$folder_choice_button.Width = 120
$folder_choice_button.Height = 25
$folder_choice_button.Text = "Choose"
$folder_choice_button.Font = $font



# Special file/folder label, text box, and selection button:
$special_file_label = New-Object System.Windows.Forms.Label
$special_file_label.Location = New-Object System.Drawing.Size(25, 75)
$special_file_label.Width = 70
$special_file_label.Height = 25
$special_file_label.Text = "File:"
$special_file_label.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$special_file_label.Font = $font

$special_file_text_box = New-Object System.Windows.Forms.Label
$special_file_text_box.Location = New-Object System.Drawing.Size((($special_file_label.Location.X + $special_file_label.Size.Width) + $labels_break), 75)
$special_file_text_box.Width = 550
$special_file_text_box.Height = 25
$special_file_text_box.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$special_file_text_box.Font = $font
$special_file_text_box.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle

$special_file_choice_button = New-Object System.Windows.Forms.Button
$special_file_choice_button.Location = New-Object System.Drawing.Size((($special_file_text_box.Location.X + $special_file_text_box.Size.Width) + $labels_break), 75)
$special_file_choice_button.Width = 120
$special_file_choice_button.Height = 25
$special_file_choice_button.Text = "Choose"
$special_file_choice_button.Font = $font



# Interval label and text box:
$interval_label = New-Object System.Windows.Forms.Label
$interval_label.Location = New-Object System.Drawing.Size(25, 125)
$interval_label.Width = 70
$interval_label.Height = 25
$interval_label.Text = "Interval:"
$interval_label.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$interval_label.Font = $font

$interval_text_box = New-Object System.Windows.Forms.TextBox
$interval_text_box.Location = New-Object System.Drawing.Size((($interval_label.Location.X + $interval_label.Size.Width) + $labels_break), 125)
$interval_text_box.Width = 50
$interval_text_box.Height = 25
$interval_text_box.Text = "6"
$interval_text_box.Font = $font
$interval_text_box.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle



# Checkbox for choosing a folder of special files:
$special_files_checkbox = New-Object System.Windows.Forms.CheckBox
$special_files_checkbox.Location = New-Object System.Drawing.Size((($interval_text_box.Location.X + $interval_text_box.Size.Width) + $labels_break + $labels_break), 125)
$special_files_checkbox.Width = 410
$special_files_checkbox.Height = 25
$special_files_checkbox.Text = "do you want to choose a folder for special files?"
$special_files_checkbox.Font = $font



# START button:
$start_button = New-Object System.Windows.Forms.Button
$start_button.Location = New-Object System.Drawing.Size(25, 175)
$start_button.Width = 120
$start_button.Height = 25
$start_button.Text = "START"
$start_button.Font = $font
$start_button.Enabled = $false



# STOP button:
$stop_button = New-Object System.Windows.Forms.Button
$stop_button.Location = New-Object System.Drawing.Size((($start_button.Location.X + $start_button.Size.Width) + $labels_break), 175)
$stop_button.Width = 120
$stop_button.Height = 25
$stop_button.Text = "STOP"
$stop_button.Font = $font
$stop_button.Enabled = $false



# Create main window:
$window = New-Object System.Windows.Forms.Form
$window.Text = "Sort_folder"
$window_width = 25 + $folder_label.Size.Width + $labels_break + $folder_text_box.Size.Width + $labels_break + $folder_choice_button.Size.Width + 25
$window_height = 25 + $folder_label.Size.Height + 25 + $special_file_label.Size.Height + 25 + $interval_label.Size.Height + 25 + $start_button.Size.Height + 25 + 25
$window.Width = $window_width
$window.Height = $window_height
$window.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$window.MaximizeBox = $false






# =========================== EVENT LOGIC ===========================

$folder_choice_button.Add_Click({
    if ($folder.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $folder_text_box.Text = $folder.SelectedPath
        Update-StartButton
    }
})

$special_file_choice_button.Add_Click({
    if ($special_files_checkbox.Checked) { # Mode: folder
        if ($special_folder.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $special_file_text_box.Text = $special_folder.SelectedPath
            Update-StartButton
        }
    } else { # Mode: single file
        if ($special_file.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $special_file_text_box.Text = $special_file.FileName
            Update-StartButton
        }
    }

})

$special_files_checkbox.Add_CheckedChanged({
    $special_file_text_box.Text = ""
    Update-StartButton

    if ($special_files_checkbox.Checked) {
        $special_file_label.Text = "Files:"
    } else {
        $special_file_label.Text = "File:"
    }

})



$start_button.Add_Click({
    # Get interval value:
    try {
        $interval_value = [int]$interval_text_box.Text
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Enter the correct number for the interval!")
        return
    }

    # Get folder and special file/folder paths:
    $folder_path = $folder_text_box.Text
    $special_file_path = $special_file_text_box.Text

    # Check if all fields are filled:
    if (-not $folder_path -or -not $special_file_path) {
        [System.Windows.Forms.MessageBox]::Show("Fill in all the fields!")
        return
    }

    # Disable START and enable STOP:
    $start_button.Enabled = $false
    $stop_button.Enabled = $true

    # Python script path:
    $scriptPath = Join-Path $PSScriptRoot "FileInterleaverCore.py"

    # Prepare ProcessStartInfo:
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "python.exe" # make sure python is in PATH
    $psi.Arguments = "`"$scriptPath`" `"$folder_path`" `"$special_file_path`" $interval_value"
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.CreateNoWindow = $true

    # Start Python process:
    $script:pythonProcess = New-Object System.Diagnostics.Process
    $script:pythonProcess.StartInfo = $psi
    $script:pythonProcess.Start() | Out-Null
})

$stop_button.Add_Click({
    if ($script:pythonProcess -ne $null -and -not $script:pythonProcess.HasExited) {
        $script:pythonProcess.Kill()

        # Disable STOP and update START button if inputs are valid:
        $stop_button.Enabled = $false
        Update-StartButton

        [System.Windows.Forms.MessageBox]::Show("Python script terminated!", "TERMINATED")
    } else {
        [System.Windows.Forms.MessageBox]::Show("No Python process is running.", "INFO")
    }
})






# ============================== MAIN ==============================

# --- folder ---
$window.Controls.Add($folder_label)
$window.Controls.Add($folder_text_box)
$window.Controls.Add($folder_choice_button)

# --- special_file ---
$window.Controls.Add($special_file_label)
$window.Controls.Add($special_file_text_box)
$window.Controls.Add($special_file_choice_button)

# --- interval ---
$window.Controls.Add($interval_label)
$window.Controls.Add($interval_text_box)

# --- special_files ---
$window.Controls.Add($special_files_checkbox)

# --- start_button ---
$window.Controls.Add($start_button)

# --- stop_button ---
$window.Controls.Add($stop_button)

$null = $window.ShowDialog() # '$null =' to prevent 'Cancel' from printing to console