---
title: Installing CodeProject.AI Server on Linux
tags:
  - CodeProject.AI
  - Linux
---

# Installing CodeProject.AI Server on Linux

To **install CodeProject.AI** as a standalone service ready for integration with applications
such as HomeAssist or BlueIris on Linux, download the 
[latest installation package](https://codeproject.github.io/codeproject.ai/latest.html)
being careful to ensure you choose the x64 (Intel chips) or arm64 (Arm chips such as
Raspberry Pi or Orange Pi).

## Prerequisites

### NVIDIA GPU support

For NVIDIA GPU support, ensure you have the latest [NVidia CUDA drivers](https://www.nvidia.com/download/index.aspx) installed.

### .NET runtime

Ensure you have the .NET runtime installed by calling

```bash
sudo apt update && sudo apt install dotnet-sdk-7.0
```

.NET will be installed when **you** run the post-install step

```bash
pushd "/usr/bin/codeproject.ai-server-2.6.2/server" && bash ../setup.sh && popd
```

## Running the installer

Unzip the .deb package, right-click and choose "install", or run
```bash
sudo dpkg -i codeproject.ai-server_2.6.2_Ubuntu_x64.deb
```
Change the file name to match the version you downloaded.

This will install the server running under systemd. CodeProject.AI
Server and the backend analysis services will now be running. The front-end server and the 
analysis services will automatically restart each time your machine is restarted.


To manually start the service, run the command
```bash
bash /usr/bin/codeproject.ai-server/start.sh
```

To **explore CodeProject.AI** Click on the CodeProject.AI Explorer link at the top of the server dashboard. 


## Accessing the CodeProject.AI Server Dashboard.
Open a browser and navigate to [http://localhost:32168](http://localhost:32168) to open the
CodeProject.AI Dashboard.  This will provide you with details of the server operation.

## Play with the Server
We provide a sample application written in HTML and JavaScript that performs various AI operations.
Open [http://localhost:32168/vision.html](http://localhost:32168/vision.html) in a browser. 
There is also a link to this at the bottom of the Dashboard.

## To uninstall CodeProject.AI.

To uninstall CodeProject.AI Server run

```bash
sudo dpkg -r codeproject.ai-server
```
Replace the version (2.6.2) with the version of the server you wish to uninstall.
