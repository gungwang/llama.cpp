@echo off
setlocal

set "BIN=%~dp0..\build-arc-a770-sycl-release\bin"
set "ONEAPI_ROOT=C:\Program Files (x86)\Intel\oneAPI"
set "PATH=%BIN%;%ONEAPI_ROOT%\compiler\latest\bin;%ONEAPI_ROOT%\mkl\latest\bin;%ONEAPI_ROOT%\dnnl\latest\bin;%ONEAPI_ROOT%\tbb\latest\bin;%ONEAPI_ROOT%\umf\latest\bin;%ONEAPI_ROOT%\ocloc\latest\bin;%PATH%"
set "SYCL_DEVICE_FILTER=level_zero:gpu:0"
set "ZES_ENABLE_SYSMAN=1"
set "GGML_SYCL_ENABLE_OPT=1"
set "GGML_SYCL_ENABLE_DNN=1"
set "GGML_SYCL_ENABLE_FUSION=1"
set "GGML_SYCL_ENABLE_ESIMD=1"
set "GGML_SYCL_ENABLE_MKL_FA=1"

pushd "%BIN%"
@REM llama-server.exe -m "C:\AI\LlamaCPP\Qwen3.8-27B-Uncensored-IQ2_M.gguf" -mm "C:\AI\LlamaCPP\Qwen3.8-27B-Uncensored-vision-f16.gguf" -ngl 999 -sm none -mg 0 -fa on -b 2048 -ub 512 -ctk q8_0 -ctv q8_0 -c 131072 -np 1 -t 16 -tb 16 --host 127.0.0.1 --port 8080 %*

@REM llama-server.exe -m "C:\AI\LlamaCPP\Qwen3.5-9B-The-Defiant-Fable-Uncnr-Heretic-NEO-MAX-IQ2_M.gguf" -mm "C:\AI\LlamaCPP\mmproj-NEO-MAX-MTP-IQ4_XS-BF16.gguf" -ngl 999 -sm none -mg 0 -fa on -b 2048 -ub 512 -ctk q8_0 -ctv q8_0 -c 81072 -t 16 -tb 16  %*

@REM The best token sepped: 28 t/s
llama-server.exe -m "C:\AI\LlamaCPP\Qwen3.5-9B-The-Defiant-Fable-Uncnr-Heretic-NEO-MAX-MTP-IQ4_XS.gguf" -mm "C:\AI\LlamaCPP\mmproj-NEO-MAX-MTP-IQ4_XS-BF16.gguf" -ngl 999 -sm none -mg 0 -fa on -b 2048 -ub 512 -ctk q8_0 -ctv q4_0 -c 46960 -np 1 -n 12192 -t 16 -tb 16 --spec-type draft-mtp --spec-draft-n-max 2 --temp 0.7 --top-p 0.80 --top-k 20 --min-p 0.0 --presence-penalty 1.5 --repeat-penalty 1.0 --host 127.0.0.1 --port 8080 %*

set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
