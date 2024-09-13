:: CodeProject.AI Server Docs
::
:: Windows Development Environment install script
::
:: We assume we're in the source code /Installers/Dev directory.
::

@echo off
cls
setlocal enabledelayedexpansion

:: verbosity can be: quiet | info | loud
set verbosity=quiet

:: If files are already present, then don't overwrite if this is false
set forceOverwrite=false

:: Show output in wild, crazy colours
set useColor=true

:: Platform can define where things are located
set platform=windows

:: Basic locations

set assetStorageUrl=https://www.codeproject.com/ai/download/server/assets/
REM set assetStorageUrl=https://codeproject-ai.s3.ca-central-1.amazonaws.com/sense/installer/dev/

:: The name of the dir, within the current directory, where install assets will
:: be downloaded
set downloadDir=downloads

:: The location of the solution root directory relative to this script
set rootPath=.



:: Override some values via parameters ::::::::::::::::::::::::::::::::::::::::

:param_loop
    if "%~1"=="" goto :end_param_loop
    if "%~1"=="--verbosity" (
        set "verbosity=%~2"
        if /i "!verbosity!" neq "loud" if /i "!verbosity!" neq "info" if /i "!verbosity!" neq "quiet" (
            set verbosity=quiet
        )
        shift
        shift
        goto :param_loop
    )
    if "%~1"=="--no-color" (
        set useColor=false
        shift
        goto :param_loop
    )
    shift
:end_param_loop


:: Absolute paths :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: The absolute path to the root directory of CodeProject.AI
set currentDir=%cd%
cd %rootPath%
set absoluteRootDir=%cd%
cd %currentDir%

set downloadPath=%absoluteRootDir%\%downloadDir%

if /i "%1" == "false" set useColor=false
if /i "%useColor%" == "true" call utils.bat setESC

call utils.bat WriteLine
call utils.bat WriteLine "General CodeProject.AI Docs setup" "DarkGreen" 

:: Create some directories
call utils.bat Write "Creating Directories..."

:: For downloading assets
if not exist "%downloadPath%\" mkdir "%downloadPath%"
call utils.bat WriteLine "Done" "Green"

:: Currently 3.9 is the latest python version our modules are using, so we'll just use this to 
:: save installing a one-off (but potentially better) version. It's just docs. Nothing crazy.
call utils.bat SetupPython 3.9

:: pythonInterpreterPath will contain the path to the latest installed Python VENV interpreter
:: !pythonInterpreterPath! -m pip install mkdocs
:: !pythonInterpreterPath! -m mkdocs
call utils.bat InstallPythonPackages 3.9 "..\mkdocs" "mkdocs"
call utils.bat WriteLine "Done" "DarkGreen" 

:: ============================================================================
:: and we're done.

call utils.bat WriteLine 
call utils.bat WriteLine "                Development Environment setup complete                  " "White" "DarkGreen"
call utils.bat WriteLine 