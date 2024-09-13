---
title: Writing install scripts for CodeProject.AI Server
tags:
  - server
  - install
---


# Writing install scripts for CodeProject.AI Server

# Installation Scripts notes

## General

The install scripts for each module will be contained in `install.sh` for Linux/macOS, and `install.bat`
for windows. These two variations mirror each other in form and variable naming.

The install scripts are call via the main `setup.sh`/`setup.bat` script. 

If `setup` is called from the `/src` folder then it runs in 'Development Environment setup' mode, 
meaning it sets up the entire environment in preparation for coding and debugging. .NET is installed,
folders are created, and every module in the /src/modules folder is setup by calling each module's 
`install` script in turn. The demo modules in the /demos will then be setup.

If the `setup` script is called from within a module's home directory (via `bash ../../setup.sh` or
`..\..\setup.bat`) then the setup script operates in 'Install module' mode, meaning it will only run
the necessary commands to setup the current module.

## Module Setup Lifecycle

Regardless of whether the setup script is running in dev or install mode, it will carry out the same 
steps when installing a single module or all modules.

1. The setup life cycle starts be detecting the current environment. The Operating system, whether it's
Intel x64 or arm64 architecture, the presence of known GPUs, the type of system (eg Jetson or 
Raspberry Pi, or just plain Windows), and the environment (eg Docker, WSL, or native).

2. The module's `modulesettings.json` file is then read to determine the module's runtime. If the module
uses Python then the version of python given by the `runtime` setting will be installed and a virtual
environment setup.

3. If no errors ocurred, the module's `install` script will be run

4. If no errors ocurred, and if the module uses Python and has an appropriate requirements.txt file,
the packages in the requirements.txt file will be installed.

5. If no errors ocurred, and if the module has a `post_install.sh` / `postinstall.bat` file then this
script will be run

## Variables available

| Variable | Description |
|---|---|
| `os`                | "linux", "macos" or "windows" |
| `architecture`      | "x86_64" or "arm64" |
| `platform`          | "linux", "linux-arm64", "macos" or "macos-arm64", "windows" or "windows-arm64" |
| `systemName`        | General name for the system. Value can be one of: Windows, Linux, macOS, WSL, Raspberry Pi, Orange Pi, Jetson, or Docker |
|||
| `rootDirPath`       | the root path of the installation (eg: ~/CodeProject/AI) |
| `sdkScriptsDirPath` | the path to the installation utility scripts ($rootDirPath/SDK/Scripts) |
| `downloadDirPath`   | the path to where downloads will be stored ($sdkScriptsDirPath/downloads) |
| `runtimesDirPath`   | the path to the installed runtimes ($rootDirPath/src/runtimes) |
| `modulesDirPath`    | the path to all the AI modules ($rootDirPath/src/modules) |
|||
| `moduleName`        | the name of the current module |
| `moduleVersion`     | the version of the current module |
| `moduleDirName`     | the name of the directory containing this module |
| `moduleDirPath`     | the path to this module ($modulesDirPath/$moduleDirName) |
| `runtime`           | The runtime this module uses. Either dotnet, pythonX.Y |
| `runtimeLocation`   | The location of the virtual environment for this module. It can either be 'Local' meaning it's sandboxed within the module itself, or 'Shared' meaning the venv in use will be used by other modules |
| `pythonVersion`     | The version of python used for this module on the current system |
| `virtualEnvDirPath` | The path to the virtual environment for this module |
| `venvPythonCmdPath` | The path to the python executable for the venv for this module |
| `packagesDirPath`   | The path to the python packages installed for this module |
|||
| `verbosity`       | quiet, info or loud. Use this to determines the noise level of output.
| `forceOverwrite`  | if true then ensure you force a re-download and re-copy of downloads. `getFromServer` will honour this value. Make sure to honour this value if you are calling `downloadAndExtract` directly |



## Methods available

| Method | Params |
|---|---|
| `write`     | text [foreground [background]] (eg write "Hi" "green")
| `writeLine` | text [foreground [background]]
| `installAptPackages` | "list of packages to install"<br>Installs a list of apt packages. <br>eg `installAptPackages "libjpeg-dev zlib1g-dev libpython3-dev"` |
| `installPythonPackagesByName` | *`PIP module names, separated by space` or `Wheel file path`, `Module name`*<br>- `PIP module name` - the name of the Python module to install, eg 'torch'<br> - `Wheel file path` - instead of a module name you can supply a wheel file path for installation<br> - `Module description` - (optional) the name or description of the module being installed<br>eg `installPythonPackagesByName "torch"`<br>`installPythonPackagesByName "my-torch-wheel.whl" "torch"`<br> - `PIP options` - (optional) Any otions you wish to pass to PIP (eg --index-url)|
|  `downloadAndExtract` | *storageUrl filename downloadDirPath dirNameToSave message*<br>`storageUrl` - Url that holds the compressed archive to Download<br>`filename` - Name of the compressed archive to be downloaded<br> `downloadDirPath` - path to where the downloaded compressed archive should be downloaded<br>`dirNameToSave` - name of directory, relative to downloadDirPath, where contents of archive will be extracted and saved<br>`message` - Message to display during download |
|  `Download`  | *storageUrl downloadDirPath filename moduleDirName message*<br> - `storageUrl` Url that holds the compressed archive to Download<<br> - `downloadDirPath` Path to where the downloaded compressed archive should be downloade<br> - `filename`      name of the compressed archive to be downloaded<br> - `dirNameToSave` name of directory, relative to downloadDirPath, where contents of archive will be extracted and saved<br> - `message` Message to display during download |
|||
|  `getFromServer` | *folder filename moduleAssetDir message*<br>`folder` - name of the folder in the S3 bucket where the file lives<br>`filename` - Name of the compressed archive to be downloaded<br>`moduleAssetDir`- Name of folder in module's directory where archive will be extracted<br>`message` - Message to display during download <br><br>Tnis method will pull an archive from the current CodeProject cloud storage. This storage is read-only and subject to change.|
|||
| `setupPython` | (Never called directly) Installs the version of python given in `pythonVersion` and sets up a virtual environment in the location set by `runtimeLocation` |
| `installRequiredPythonPackages` | (Never called directly) Installs the python packages included in the appropriate requirements.txt file in the current module into the current virtual environment for this module<br>`requirements-file-directory` - an optional parameter specifying the directory containing the requirements.txt file |

To call a method in a Linux/macOS install script, use `method parameters` (eg writeLine "Hello, World!"). To call a method in a Windows install script, use call `"%sdkScriptsDirPath%\utils.bat" method params` (eg %sdkScriptsDirPath%\utils.bat WriteLine "Hello, World!").