@echo off
REM A script to build the Windows installer natively on Windows.

echo IMPORTANT: Please ensure you have installed the following dependencies before running this script:
echo 1. Chocolatey (from https://chocolatey.org/install)
echo 2. Node.js LTS (choco install nodejs-lts --version=18.17.0 -y)
echo 3. Git (choco install git -y)
echo 4. Zip (choco install zip -y)
echo.
pause

echo Removing old node_modules directory...
IF EXIST node_modules (
  rd /s /q node_modules
)

echo Installing npm dependencies...
call npm install

echo Running monkeypatch...
call npm run monkeypatch

echo Installing app dependencies...
call .\node_modules\.bin\electron-builder install-app-deps

echo Building the Windows installer...
call .\node_modules\.bin\electron-builder -w

echo Zipping the output...
call npm run zip

echo.
echo Build finished. The installer can be found in the 'dist-win32' directory.
pause
