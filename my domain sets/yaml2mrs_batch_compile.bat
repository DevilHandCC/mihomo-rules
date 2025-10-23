@REM compile MRS rules from all .txt files in the current directory
@REM REM Usage: Place this script in the directory with .txt files and run it.
@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 设置 mihomo 路径（如在当前目录就写成 .\mihomo.exe）
set MIHOMO_EXE="mihomo"

:: 循环编译所有 yaml 文件
for %%f in (*.yaml) do (
    echo 正在编译: %%f ...
    %MIHOMO_EXE% convert-ruleset domain yaml %%f %%~nf.mrs
    if !errorlevel! == 0 (
        echo [成功] 生成 %%~nf.mrs
    ) else (
        echo [失败] %%f
    )
)

echo.
echo 全部处理完成。
pause
