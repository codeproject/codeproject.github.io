echo off
REM Assuming we're in the /mkdocs directory

call .\bin\windows\python39\venv\Scripts\activate.bat
pushd CodeProject.AI
python -m mkdocs build
robocopy /e .\site ..\..\codeproject.ai
popd
call .\bin\windows\python39\venv\Scripts\deactivate.bat
