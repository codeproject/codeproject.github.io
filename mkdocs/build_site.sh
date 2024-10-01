
# Assuming we're in the /mkdocs directory

if [[ $OSTYPE == 'darwin'* ]]; then
    bash ./bin/macos/python39/venv/bin/activate
else
    bash ./bin/linux/python39/venv/bin/activate
fi


pushd CodeProject.AI

if [[ $OSTYPE == 'darwin'* ]]; then
    ../bin/macos/python39/venv/bin/python3 -m mkdocs build
else
    ../bin/linux/python39/venv/bin/python3 -m mkdocs build
fi
cp -r ./site/* ../../codeproject.ai/

popd

cp ../codeproject.ai-server_latest.html ./codeproject.ai/latest.html
