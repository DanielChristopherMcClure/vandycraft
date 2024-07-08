@echo off
setlocal

:: Function to check if the current directory is a git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Error: The current directory is not a git repository.
    exit /b 1
)

echo Syncing the current directory with its checked-out repository...

:: Fetch the latest changes from the remote repository
git fetch origin

:: Reset the current branch to the latest commit from the remote repository, discarding local changes
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set branch=%%i
git reset --hard origin/%branch%

:: Clean untracked files and directories
git clean -fd

echo Directory has been successfully synced and all changes have been discarded.

endlocal
exit /b 0
