echo off
REM Assuming we're in the /mkdocs directory

call .\bin\windows\python39\venv\Scripts\activate.bat

pushd CodeProject.AI
python -m mkdocs build
robocopy /e .\site ..\..\codeproject.ai
popd

copy ..\codeproject.ai-server_latest.html ..\codeproject.ai\
del ..\codeproject.ai\latest.html
rename ..\codeproject.ai\codeproject.ai-server_latest.html latest.html

call .\bin\windows\python39\venv\Scripts\deactivate.bat
