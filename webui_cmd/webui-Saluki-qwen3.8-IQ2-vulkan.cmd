@echo off
setlocal

set "BIN=%~dp0..\..\build-arc-a770-vulkan-release\bin"
set "PATH=%BIN%;%PATH%"

pushd "%BIN%"

@REM Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-IQ2_M.gguf
@REM mmproj-Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-BF16.gguf
@REM Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-FastMTP-32K.gguf
llama-server.exe -m "C:\AI\LlamaCPP\Underdog-Saluki-27B-1.0-IQ2-mix.gguf" --mmproj "C:\AI\LlamaCPP\mmproj-Underdog-Saluki-27B-1.0-F16.gguf" -ngl 999 -fit off -sm none -mg 0 -fa on -b 1024 -ub 256 -ctk q8_0 -ctv q4_0 -c 32768 -np 1 -n 16096 -t 8 -tb 8 --prio -1 --jinja --temp 0.6 --top-p 0.95 --top-k 20 --min-p 0.0 --host 127.0.0.1 --port 8088 %*



set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
