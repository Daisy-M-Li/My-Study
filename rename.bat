@echo off
title rename file
echo.
echo star
echo.
echo.&set /p file_type= sql:
echo.&set /p add_str= cim:
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a /b *.%file_type%') do (
ren "%%~a" "%add_str%_%%a")
echo.
echo close
echo.
pause
