$trigger_key = ’Ctrl+Alt+C’ # Example: Use Ctrl+Alt+C as the trigger combination
Write-Host ’Monitoring for the trigger event...’
Write-Host "Press $trigger_key to prevent data copying."
while ($true) {
Start-Sleep -Milliseconds 1000
if (Get-Keystroke -Key $trigger_key -ErrorAction SilentlyContinue) {
Write-Host ’Trigger event detected! Preventing data copying...’
Invoke-CorruptFile -FilePath ’/path/to/your/file.txt’
# Add the mechanism to block copying here
# For example, you can clear the clipboard using: Set-Clipboard -Value ’’
Write-Host ’Data copying prevented.’
break
}
}
function Invoke-CorruptFile {
param (
[Parameter(Mandatory = $true)]
[string]$FilePath
)
$CorruptedFilePath = $FilePath + ’.corrupted’
Rename-Item -Path $FilePath -NewName $CorruptedFilePath
}