@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo Interactive WiFi Profile Deleter
echo ========================================
echo.

:: Create a PowerShell script to handle the deletion
set "psScript=%temp%\wifi_delete.ps1"

echo $profiles = netsh wlan show profiles ^| Select-String "All User Profile" ^| ForEach-Object { $_.Line.Split(':')[1].Trim() } > "%psScript%"
echo. >> "%psScript%"
echo $count = 0 >> "%psScript%"
echo foreach ($profile in $profiles) { >> "%psScript%"
echo     Write-Host "Profile: $profile" -ForegroundColor Cyan >> "%psScript%"
echo     $response = Read-Host "Delete this profile? (y/n)" >> "%psScript%"
echo. >> "%psScript%"
echo     if ($response -eq 'y' -or $response -eq 'Y') { >> "%psScript%"
echo         $result = netsh wlan delete profile name="$profile" 2^>^&1 >> "%psScript%"
echo         if ($LASTEXITCODE -eq 0) { >> "%psScript%"
echo             Write-Host "[DELETED] $profile" -ForegroundColor Green >> "%psScript%"
echo         } else { >> "%psScript%"
echo             Write-Host "[FAILED] Could not delete $profile" -ForegroundColor Red >> "%psScript%"
echo         } >> "%psScript%"
echo     } else { >> "%psScript%"
echo         Write-Host "[KEPT] $profile" -ForegroundColor Yellow >> "%psScript%"
echo     } >> "%psScript%"
echo     Write-Host "" >> "%psScript%"
echo     $count++ >> "%psScript%"
echo } >> "%psScript%"
echo. >> "%psScript%"
echo Write-Host "========================================" >> "%psScript%"
echo Write-Host "Processed $count profiles" >> "%psScript%"
echo Write-Host "Operation completed!" >> "%psScript%"
echo Write-Host "========================================" >> "%psScript%"
echo Write-Host "" >> "%psScript%"
echo Write-Host "========================================" >> "%psScript%"
echo Write-Host "Remaining WiFi Profiles:" >> "%psScript%"
echo Write-Host "========================================" >> "%psScript%"
echo netsh wlan show profiles ^| Select-String "All User Profile" >> "%psScript%"
echo Write-Host "========================================" >> "%psScript%"
echo Write-Host "" >> "%psScript%"
echo Read-Host "Press Enter to exit" >> "%psScript%"

:: Run the PowerShell script
powershell -ExecutionPolicy Bypass -File "%psScript%"

:: Cleanup
del "%psScript%" 2>nul

endlocal