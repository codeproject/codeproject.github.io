# Assuming we're in the /docs/mkdocs directory

if [[ $OSTYPE == 'darwin'* ]]; then
    bash ./bin/macos/python39/venv/bin/activate
else
    bash ./bin/linux/python39/venv/bin/activate
fi

pushd CodeProject.AI

if [[ $OSTYPE == 'darwin'* ]]; then
    open http://127.0.0.1:8000/ &
    ../bin/macos/python39/venv/bin/python3 -m mkdocs serve
else
    xdg-open http://127.0.0.1:8000/ &
    ../bin/linux/python39/venv/bin/python3 -m mkdocs serve
fi

popd