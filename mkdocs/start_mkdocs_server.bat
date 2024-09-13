echo off
REM Assuming we're in the /mkdocs directory

call .\bin\windows\python39\venv\Scripts\activate.bat
pushd CodeProject.AI
start /b "" http://127.0.0.1:8000/
python -m mkdocs serve
popd
call .\bin\windows\python39\venv\Scripts\deactivate.bat
