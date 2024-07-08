@echo off
setlocal

:: URL of the repository to clone
set REPO_URL=https://github.com/DanielChristopherMcClure/vandycraft.git

:: Temporary directory to clone the repository into
set TEMP_DIR=%TEMP%\repo_temp

:: Check if the temporary directory exists, if so, delete it
if exist "%TEMP_DIR%" (
    rd /s /q "%TEMP_DIR%"
)

:: Clone the repository into the temporary directory
git clone %REPO_URL% "%TEMP_DIR%"

:: Move the contents of the temporary directory to the current directory
xcopy "%TEMP_DIR%\*" "%CD%\" /s /e /h /k

:: Remove the temporary directory
rd /s /q "%TEMP_DIR%"

echo Repository has been successfully cloned into the current directory.

endlocal
exit /b 0
