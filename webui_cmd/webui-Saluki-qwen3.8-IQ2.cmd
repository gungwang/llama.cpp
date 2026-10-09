@echo off
setlocal

set "BIN=%~dp0"
set "ONEAPI_ROOT=C:\Program Files (x86)\Intel\oneAPI"
set "PATH=%BIN%;%ONEAPI_ROOT%\compiler\latest\bin;%ONEAPI_ROOT%\mkl\latest\bin;%ONEAPI_ROOT%\dnnl\latest\bin;%ONEAPI_ROOT%\tbb\latest\bin;%ONEAPI_ROOT%\umf\latest\bin;%ONEAPI_ROOT%\ocloc\latest\bin;%PATH%"
set "SYCL_DEVICE_FILTER="
set "ONEAPI_DEVICE_SELECTOR=opencl:0"
set "GGML_SYCL_ENABLE_OPT=1"
set "GGML_SYCL_ENABLE_DNN=1"
set "GGML_SYCL_ENABLE_FUSION=1"
set "GGML_SYCL_ENABLE_ESIMD=1"
set "GGML_SYCL_ENABLE_MKL_FA=1"

pushd "%BIN%"

@REM Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-IQ2_M.gguf
@REM mmproj-Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-BF16.gguf
@REM Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-FastMTP-32K.gguf
llama-server.exe -m "C:\AI\LlamaCPP\Underdog-Saluki-27B-1.0-IQ2-mix.gguf" --mmproj "C:\AI\LlamaCPP\mmproj-Underdog-Saluki-27B-1.0-F16.gguf" -ngl auto -fit on -fitt 2048 -sm none -mg 0 -fa on -b 1024 -ub 256 -ctk q8_0 -ctv q4_0 -c 32768 -np 1 -n 16096 -t 8 -tb 8 --prio -1 --jinja --temp 0.6 --top-p 0.95 --top-k 20 --min-p 0.0 --host 127.0.0.1 --port 8080 %*



set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
