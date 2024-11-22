# Release Notes

### Release 2.9 Beta

 - Updated to .NET 9
 - Support for Ubuntu 24.10
 - Improved CUDA 12 support
 - Improvements to CUDA support in Windows and Linux
 - Further Windows arm64 fixes
 - Further macOS arm64 fixes
 - General dev environment setup fixes
 - Fixes for Windows installer when wget is missing

### Release 2.8 Beta

- General fixes and reorg of project

### Release 2.6 Beta

 - You can now select, at install time, which modules you wish to have initially installed
 - Some modules (Coral, Yolov8) now allow you to download individual models at runtime via the dashboard.
 - A new generative AI module (Llama LLM Chatbot)
 - A standardised way to handle (in code) modules that run long processes such as generative AI
 - Debian support has been improved
 - Small UI improvements to the dashboard
 - Some simplification of the modulesettings files
 - The inclusion, in the source code, of template .NET and Python modules (both simple and long process demos)
 - Improvements to the Coral and ALPR modules (thanks to Seth and Mike)
 - Docker CUDA 12.2 image now includes cuDNN
 - Install script fixes
 - Added Object Segmentation to the YOLOv8 module

### Release 2.5 Beta

 - Dynamic Explorer UI: Each module now supplies its own UI for the explorer
 - More information returned by each module's response as standard
 - Support for sound audition modules in the explorer
 - Improvements to, and a more responsive module status on the dashboard
 - Updated module settings schema that includes module author and original project acknowledgement
 - A separate status update from each module that decouples the stats for a module. This just cleans things up a little on the backend
 - Installer fixes
 - Minor modulesettings.json schema update, which introduces the concept of model requirements.
 - Updated ALPR, OCR (thanks to Mike Lud) and Coral Object Detection (Thanks to Seth Price) modules
 - Improved Jetson support
 - Pre-installed modules in Docker can now be uninstalled / reinstalled 

### Release 2.4 Beta

 - **Mesh support** Automatically offload inference work to other servers on your network based on inference speed. Zero config, and dashboard support to enable/disable.
 - CUDA detection fixed
 - Support for CUDA 10.2
 - Module self-test performed on installation
 - YOLOv8 module added
 - YOLOv5 .NET module fixes for GPU, and YOLOv5 3.1 GPU support fixed
 - Python package and .NET installation issues fixed
 - Better prompts for admin-only installs
 - Fixes for Python package installs
 - Issues installing .NET
 - More logging output to help diagnose issues
 - VC Redist hash error fixed
 - General bug fixes.
 - Breaking: modulesettings.json schema changed

### Release 2.3 Beta

- A focus on improving the installation of modules at runtime. More error checks, faster re-install, better reporting, and manual fallbacks in situations where admin rights are needed
- A revamped SDK that removes much (or all, in some cases) of the boilerplate code needed in install scripts
- Fine grained support for different CUDA versions as well as systems such as Raspberry Pi, Orange Pi and Jetson
- Support for CUDA 12.2
- GPU support for PaddlePaddle (OCR and license plate readers benefit)
- CUDA 12.2 Docker image
- Lots of bug fixes in install scripts
- UI tweaks
- ALPR now using GPU in Windows
- Corrections to Linux/macOS installers

### Release 2.2 Beta

- An entirely new Windows installer offering more installation options and a smoother upgrade experience from here on.
- New macOS and Ubuntu native installers, for x64 and arm64 (including Raspberry Pi)
- A new installation SDK for making module installers far easier
- Improved installation feedback and self-checks
- Coral.AI support for Linux, macOS (version 11 and 12 only) and Windows

### Release 2.1 Beta

- Improved Raspberry Pi support. A new, fast object detection module with
  support for the Coral.AI TPU, all within an Arm64 Docker image
- All modules can now be installed / uninstalled (rather than having some modules fixed and uninstallble).
- Installer is streamlined: Only the server is installed at installation time, and on first run we install Object Detection (Python and .NET) and Face Processing (which can be uninstalled).
- Reworking of the Python module SDK. Modules are new child classes, not aggregators of our module runner.
- Reworking of the modulesettings file to make it simpler and have less replication
- Improved logging: quantity, quality, filtering and better information
- Addition of 2 modules: ObjectDetectionTFLite for Object Detection on a on Raspberry Pi using Coral, 
  and Cartoonise for some fun
- Improvements to half-precision support checks on CUDA cards
- Modules are now versioned and our module registry will now only show modules that fit your current server version.
- Various bug fixes
- Shared Python runtimes now in `runtimes`. 
- All modules moved from the `AnalysisLayer` folder to the `modules` folder
- Tested on CUDA 12 (Note: ALPR and OCR do not run on CUDA 12)

### Release 2.0 Beta
- New Downloadable module system
- Re-introduction of PyTorch 1.7 YOLO module for older GPUs
- .NET 7

### Release 1.6.0.0 Beta
- Optimised RAM use
- Ability to enable / disable modules and GPU support via the dashboard
- REST settings API for updating settings on the fly
- Apple M1/M2 GPU support
- Async processes and logging for a performance boost
- Breaking: the CustomObjectDetection is now part of ObjectDetectionYolo

### Release 1.5.6.2 Beta
- Docker NVIDIA GPU support
- Further performance improvements
- cuDNN install script to help with NVIDIA driver and toolkit installation
- Bug fixes

### Release 1.5.6 Beta
- NVIDIA GPU support for Windows
- Perf improvements to Python modules
- Work on the Python SDK to make creating modules easier
- Dev installers now drastically simplified for those creating new modules
- Added SuperResolution as a demo module

### Release 1.5 Beta
- Support for custom models

### Release 1.3.x Beta
- Refactored and improved setup and module addition system
- Introduction of modulesettings.json files
- New analysis modules

### Release 1.2.x Beta
- Support for Apple Silicon for development mode
- Native Windows installer
- Runs as Windows Service
- Run in a Docker Container
- Installs and Builds using VSCode in Linux (Ubuntu), macOS and Windows, as well as Visual Studio on Windows
- General optimisation of the download payload sizes

### Previous
- We started with a proof of concept on Windows 10+ only. Installs we via a simple BAT script, and the code has is full of exciting sharp edges. A simple dashboard and playground are included. Analysis is currently Python code only
- Version checks are enabled to alert users to new versions
- A new .NET implementation scene detection using the YOLO model to ensure the codebase is platform and tech stack agnostic
- Blue Iris integration completed