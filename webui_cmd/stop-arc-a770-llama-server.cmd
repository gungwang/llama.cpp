@echo off
setlocal

set "LLAMA_BIN=%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$bin = (Resolve-Path -LiteralPath $env:LLAMA_BIN).Path.TrimEnd('\'); $servers = @(Get-CimInstance Win32_Process -Filter \"Name = 'llama-server.exe'\" | Where-Object { $_.ExecutablePath -and [IO.Path]::GetFullPath($_.ExecutablePath).StartsWith($bin + '\', [StringComparison]::OrdinalIgnoreCase) }); if ($servers.Count -eq 0) { Write-Host 'No llama-server process from this build is running.'; exit 0 }; foreach ($server in $servers) { Stop-Process -Id $server.ProcessId -ErrorAction Stop; Write-Host ('Stopped llama-server process {0}.' -f $server.ProcessId) }"
exit /b %ERRORLEVEL%
