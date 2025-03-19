# Base64 Konverter Skript für PowerShell 5.1
# Dieses Skript ermöglicht das Umwandeln von Text oder Dateiinhalt in Base64 und umgekehrt.
# Dabei wird als Standardencoding Unicode verwendet.

# Funktion zum Auswählen einer Datei über einen Windows-Dialog
function Select-File {
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $FileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $FileDialog.Filter = "Alle Dateien (*.*)|*.*"
    if ($FileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $FileDialog.FileName
    } else {
        Write-Host "Keine Datei ausgewählt. Skript beendet."
        exit
    }
}

# Funktion: String zu Base64 kodieren
function Convert-StringToBase64($inputString) {
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($inputString)
    $base64String = [Convert]::ToBase64String($bytes)
    return $base64String
}

# Funktion: Base64-String decodieren
function Convert-Base64ToString($base64String) {
    try {
        $bytes = [Convert]::FromBase64String($base64String)
        $plainText = [System.Text.Encoding]::Unicode.GetString($bytes)
        return $plainText
    } catch {
        Write-Host "Ungültiger Base64-String. Bitte überprüfen Sie die Eingabe."
        return $null
    }
}

# Verarbeitung der Umwandlung für einen direkt eingegebenen String
function Process-StringConversion {
    Write-Host "`nBitte wählen Sie die gewünschte Option:"
    Write-Host "1. String zu Base64 codieren"
    Write-Host "2. Base64 zu String decodieren"
    $choice = Read-Host "Ihre Wahl (1 oder 2)"
    
    if ($choice -eq "1") {
        $inputText = Read-Host "Geben Sie den Text ein, der codiert werden soll"
        $result = Convert-StringToBase64 $inputText
        Write-Host "`nBase64-codierter Text:`n$result"
    } elseif ($choice -eq "2") {
        $inputText = Read-Host "Geben Sie den Base64-codierten Text ein, der decodiert werden soll"
        $result = Convert-Base64ToString $inputText
        if ($result -ne $null) {
            Write-Host "`nDecodierter Text:`n$result"
        }
    } else {
        Write-Host "Ungültige Auswahl. Skript beendet."
    }
}

# Verarbeitung der Umwandlung des Inhalts einer Datei
function Process-FileConversion {
    Write-Host "`nBitte wählen Sie die Option für die Dateikonvertierung:"
    Write-Host "1. Dateiinhalt zu Base64 codieren"
    Write-Host "2. Base64-codierten Dateiinhalt zu String decodieren"
    $choice = Read-Host "Ihre Wahl (1 oder 2)"
    
    # Datei mittels Dialog auswählen
    $filePath = Select-File
    if (-not (Test-Path $filePath)) {
        Write-Host "Die ausgewählte Datei existiert nicht. Skript beendet."
        exit
    }
    
    # Dateiinhalt als gesamter String einlesen (unabhängig vom Dateityp)
    $fileContent = Get-Content -Path $filePath -Raw
    
    if ($choice -eq "1") {
        $result = Convert-StringToBase64 $fileContent
        Write-Host "`nBase64-codierter Dateiinhalt:`n$result"
    } elseif ($choice -eq "2") {
        $result = Convert-Base64ToString $fileContent
        if ($result -ne $null) {
            Write-Host "`nDecodierter Dateiinhalt:`n$result"
        }
    } else {
        Write-Host "Ungültige Auswahl. Skript beendet."
    }
}

# Hauptmenü
Write-Host "========================================="
Write-Host "      Base64 Konverter Skript"
Write-Host "========================================="
Write-Host "`nBitte wählen Sie eine Option:"
Write-Host "1. Umwandlung eines Strings"
Write-Host "2. Umwandlung des Inhalts einer Datei"
$mainChoice = Read-Host "Ihre Wahl (1 oder 2)"

if ($mainChoice -eq "1") {
    Process-StringConversion
} elseif ($mainChoice -eq "2") {
    Process-FileConversion
} else {
    Write-Host "Ungültige Auswahl. Skript beendet."
}
