@echo off
setlocal

set "BIN=%~dp0..\build-arc-a770-sycl-release\bin"
set "ONEAPI_ROOT=C:\Program Files (x86)\Intel\oneAPI"
set "PATH=%BIN%;%ONEAPI_ROOT%\compiler\latest\bin;%ONEAPI_ROOT%\mkl\latest\bin;%ONEAPI_ROOT%\dnnl\latest\bin;%ONEAPI_ROOT%\tbb\latest\bin;%ONEAPI_ROOT%\umf\latest\bin;%ONEAPI_ROOT%\ocloc\latest\bin;%PATH%"
set "SYCL_DEVICE_FILTER=level_zero:gpu:0"
set "GGML_SYCL_ENABLE_OPT=1"
set "GGML_SYCL_ENABLE_DNN=1"
set "GGML_SYCL_ENABLE_FUSION=1"
set "GGML_SYCL_ENABLE_ESIMD=1"
set "GGML_SYCL_ENABLE_MKL_FA=1"

pushd "%BIN%"
llama-cli.exe -m "C:\AI\LlamaCPP\Qwen3.8-27B-Uncensored-IQ2_M.gguf" -mm "C:\AI\LlamaCPP\Qwen3.8-27B-Uncensored-vision-f16.gguf" -ngl 999 -sm none -mg 0 -fa on -b 2048 -ub 512 -ctk q8_0 -ctv q8_0 -c 131072 -np 1 -t 16 -tb 16 %*
set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
