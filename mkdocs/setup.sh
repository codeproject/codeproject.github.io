#!/bin/bash
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# CodeProject.AI Server Docs
# 
# Unix/Linux/macOS Development Environment install script
# 
# We assume we're in the source code /Installers/Dev directory.
# 
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# import the utilities
source $(dirname "$0")/utils.sh

useColor="true"

clear

# verbosity can be: quiet | info | loud
verbosity="quiet"

# If files are already present, then don't overwrite if this is false
forceOverwrite=false



# Basic locations

# The location of the solution root directory relative to this script
rootPath='.'

# CodeProject.AI Server specific ::::::::::::::::::::::::::::::::::::::::::::::::::::


# Shared :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# The location of large packages that need to be downloaded
assetStorageUrl='https://codeproject-ai.s3.ca-central-1.amazonaws.com/sense/installer/dev/'

# The name of the dir, within the current directory, where install assets will
# be downloaded
downloadDir='downloads'

# Absolute paths :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# The absolute path to the root directory of CodeProject.AI
currentDir="$(pwd)"
cd $rootPath
absoluteRootDir="$(pwd)"
cd $currentDir

# The location of directories relative to the root of the solution directory
downloadPath="${absoluteRootDir}/${downloadDir}"

# Set Flags

wgetFlags='-q --no-check-certificate'
pipFlags='--quiet --quiet'
copyFlags='/NFL /NDL /NJH /NJS /nc /ns  >/dev/null'
unzipFlags='-qq'
tarFlags='xf'

if [ $verbosity == "info" ]; then
    wgetFlags='--no-verbose --no-check-certificate'
    pipFlags='--quiet'
    rmdirFlags='/q'
    copyFlags='/NFL /NDL /NJH'
    unzipFlags='-q'
    tarFlags='xf'
elif [ $verbosity == "loud" ]; then
    wgetFlags='-v --no-check-certificate'
    pipFlags=''
    rmdirFlags=''
    copyFlags=''
    unzipFlags=''
    tarFlags='xvf'
fi

if [ "$platform" == "macos" ] || [ "$platform" == "macos-arm" ]; then
    pipFlags="${pipFlags} --no-cache-dir"
fi

if [ "$useColor" != "true" ]; then
    pipFlags="${pipFlags} --no-color"
fi

checkForTool wget
checkForTool unzip

# if [ "$platform" == "linux" ] && [ "$EUID" -ne 0 ]; then
#    writeLine "Please run this script as root: sudo bash setup.sh" $color_error
#    exit
#fi

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 1. Ensure directories are created and download required assets

writeLine
writeLine 'CodeProject.AI Docs setup                                                        ' "White" "Blue"

# Create some directories

# For downloading assets
write "Creating Directories..." $color_primary
if [ $verbosity == "loud" ]; then writeLine "downloadPath is ${downloadPath}"; fi;

mkdir -p "${downloadPath}"
if [ "$platform" == "macos" ] || [ "$platform" == "macos-arm" ]; then 
    if [[ ! -w "${downloadPath}" ]]; then
        write "We'll need to run under root to set permissions. " $color_warn
        sudo chmod 777 "${downloadPath}"
    fi
else
    write "Creating Directories..." $color_primary
fi
writeLine "Done" $color_success


# The Docs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# Currently 3.9 is the latest python version our modules are using, so we'll just use this to 
# save installing a one-off (but potentially better) version. It's just docs. Nothing crazy.
setupPython 3.9

write "Installing MKDocs..." 
installPythonPackages 3.9 "${absoluteRootDir}/mkdocs" "mkdocs"
writeLine "Done" "DarkGreen" 


# ============================================================================
# ...and we're done.

writeLine 
writeLine '                Development Environment setup complete                  ' 'White' 'DarkGreen'
writeLine 

quit