::rename file name
@echo off
title rename file
echo.
echo star
echo.
::input file type eg=sql
echo.&set /p file_type= file_suffix:
::input rename string ed=re
echo.&set /p add_str= rename_prefix:
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a /b *.%file_type%') do (
:: replace 'a' to 're_a'
ren "%%~a" "%add_str%_%%a")
echo.
echo close
echo.s
pause
