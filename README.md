Hier ist eine Beispiel-README-Datei in Markdown, die alle relevanten Informationen enthält:

---

# Base64 Konverter Skript

Dieses Skript ermöglicht es, Texte und den Inhalt von Dateien in Base64 zu kodieren bzw. Base64-codierten Text wieder zu dekodieren. Es bietet ein interaktives Menü, mit dem Du entweder einen direkten String eingeben oder eine Datei auswählen kannst, deren Inhalt umgewandelt werden soll.

## Funktionen

- **String-Konvertierung:**
  - **Kodierung:** Wandelt einen eingegebenen Klartext-String in einen Base64-codierten String um.
  - **Dekodierung:** Wandelt einen Base64-codierten String zurück in den ursprünglichen Klartext.

- **Datei-Konvertierung:**
  - **Kodierung:** Öffnet einen Windows-Dateidialog zur Auswahl einer Datei und kodiert den gesamten Inhalt in Base64.
  - **Dekodierung:** Öffnet einen Windows-Dateidialog zur Auswahl einer Datei, die Base64-codierten Text enthält, und dekodiert diesen in Klartext.

## Voraussetzungen

- **Betriebssystem:** Windows
- **PowerShell Version:** 5.1 (das Skript wurde mit dieser Version getestet)
- **.NET Framework:** Wird benötigt, um den Windows Forms-Dateidialog zu nutzen (in der Regel vorinstalliert).

## Installation und Ausführung

1. **Skript herunterladen:**

   Speichere das Skript als `Base64Converter.ps1` in einem gewünschten Verzeichnis.

2. **PowerShell-Ausführungsrichtlinie anpassen:**

   Windows blockiert standardmäßig das Ausführen von PowerShell-Skripten. Um das Skript auszuführen, kannst Du die Ausführungsrichtlinie für die aktuelle Sitzung anpassen, indem Du in einer PowerShell-Konsole folgenden Befehl eingibst:

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```

   Alternativ kannst Du das Skript direkt mit der Option `-ExecutionPolicy Bypass` starten:

   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File "Pfad\zum\Base64Converter.ps1"
   ```

3. **Skript ausführen:**

   Starte das Skript in der PowerShell-Konsole. Nach dem Start erscheint ein Menü, in dem Du wählst:
   - **Option 1:** Umwandlung eines eingegebenen Strings
   - **Option 2:** Umwandlung des Inhalts einer Datei

## Bedienung

### String-Konvertierung

Nach Auswahl der String-Option wirst Du aufgefordert, zwischen folgenden Modi zu wählen:

- **1. Kodierung:**  
  Gib den Text ein, der in Base64 umgewandelt werden soll. Das Skript zeigt Dir den Base64-codierten String an.

- **2. Dekodierung:**  
  Gib den Base64-codierten String ein, der in den ursprünglichen Klartext zurückverwandelt werden soll.

### Datei-Konvertierung

Nach Auswahl der Datei-Option öffnet sich ein Windows-Dateidialog, mit dem Du eine Datei auswählen kannst. Unabhängig vom Dateityp wird der gesamte Inhalt als Text eingelesen.

- **1. Kodierung:**  
  Der Inhalt der ausgewählten Datei wird in Base64 kodiert und angezeigt.

- **2. Dekodierung:**  
  Der Base64-codierte Inhalt der Datei wird dekodiert und der Klartext angezeigt.

*Hinweis:* Das Skript liest den gesamten Dateiinhalt als String ein. Es eignet sich daher am besten für Textdateien.

## Lizenz

Dieses Projekt ist unter der MIT Lizenz veröffentlicht. Weitere Informationen findest Du in der [LICENSE](LICENSE)-Datei.
