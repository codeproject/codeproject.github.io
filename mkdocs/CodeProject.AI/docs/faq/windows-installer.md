---
title: Windows Installer
tags:
  - Windows
---

## Can't find custom models

When CodeProject.AI Server is installed it will comes with two different object detection modules. Both modules work the same, with the difference that one is a Python implementation that supports CUDA GPUs, and the other is a .NET implementation that supports embedded Intel GPUs. Each come with the same set of custom models that can be used. For custom object detection you need to:

1.  Ensure Object Object detection is enabled (it is by default)
2.  Use the provided custom models, or a. add your own models to the standard custom model folder (*C:\Program Files\CodeProject\AI\modules\ObjectDetectionYolo\custom-models* or *C:\Program Files\CodeProject\AI\modules\ObjectDetectionNet\custom-models*) if using a Windows install, or b. specify a directory that will contain the models (handy for Docker)

To specify a different folder to use for custom models, you can

1.  Set the `--Modules:ObjectDetectionYolo:EnvironmentVariables:CUSTOM_MODELS_DIR` parameter when launching, **or**
2.  Set the `Modules:ObjectDetectionYolo:EnvironmentVariables:CUSTOM_MODELS_DIR` environment variable, **or**
3.  Set the `CUSTOM_MODELS_DIR` value in the modulesettings.json file in the ObjectDetectionYolo folder, **or**
4.  Set the global override (to be deprecated!) variable `MODELSTORE-DETECTION` to point to your custom object folder, **or**
5.  (For Docker) Map the folder containing your custom models (eg. *C:\MyCustomModels*) to the Object Detection's custom assets folder (*/app/modules/ObjectDetectionYolo/custom-models*). An example would be:

``` batch  title='Terminal'
docker run -p 32168:32168 --name CodeProject.AI-Server -d ^
  --mount type=bind,source=C:\ProgramData\CodeProject\AI\docker\data,target=/etc/codeproject/ai ^
  --mount type=bind,source=C:\MyCustomModels,target=/app/modules/ObjectDetectionYolo/custom-models,readonly 
    codeproject/ai-server
```

    This mounts the *C:\MyCustomModels* directory on my local system and maps it to the */app/modules/ObjectDetectionYolo/custom-models* folder in the Docker container. Now, when CodeProject.AI Server is looking for the list of custom models, it will look in *C:\MyCustomModels* rather than */app/modules/ObjectDetectionYolo/custom-models*

    See the [API Reference - CodeProject.AI Server](https://www.codeproject.com/AI/docs/api/api_reference.html#custom-object-detector)

## Port already in use

If you see:

```
Unable to start Kestrel.
System.IO.IOException: Failed to bind to address http://127.0.0.1:5000: address 
   already in use.
```

Either you have CodeProject.AI already running, or another application is using port 5000.

Our first suggestion is to no longer use port 5000. It's a reserved port, though not all operating systems are actively using it. We prefer port 32168 since it's easy to remember and well out of harm's way of other used ports.

You can change the external port that CodeProject.AI uses by editing the *appsettings.json* file and changing the value of the `CPAI_PORT` variable. In the demo app there is a Port setting you will need to edit to match the new port.

Failing that, shut down any application using port 5000 (including any installed version of CodeProject.AI Server if you're trying to run in Development mode in Visual Studio).

## GPU is not being used

Please ensure you have the NVidia CUDA drivers installed:

1.  Install the [CUDA 11.7 Drivers](https://www.nvidia.com/Download/index.aspx)
2.  Install the [CUDA Toolkit 11.7](https://developer.nvidia.com/cuda-downloads).
3.  Download and run our [cuDNN install script](/KB/Articles/5322557/install_CUDnn.zip).

## CodeProject.AI Server stops randomly (often at the same time of the day)

If you're finding CodeProject.AI Server is randomly going offline once (or sometimes twice) a day, or if you find certain modules like the License Plate Reader are shutting down once a day, there may be conflict with backup software. In order to determine if this is the case, manually run your backup and see if CodeProject.AI Server goes offline. Interestingly, the service is still running, but shows as "Offline." It may be related to specific backup software, like Acronis.

For the Licence Plate Reader shutting down, and you're using the GPU for CodeProject.AI Server and running an AMD GPU, try enabling Object Detection (YOLOv5.NET) and disable the Object Detection (YOLOv5.6.2). The latter only supports newer NVidia GPUs, while the former uses DirectX on Windows or WSL to access the GPU so it will support your AMD GPU if you have the DirectX driver installed.

## OSError: [WinError 1455] The paging file is too small for this operation to complete

In a nutshell, your paging file is too small. If you've changed (reduced) your paging file settings to save disk space you may want to increase the size to provide more headroom for the system. Failing that it could simply be the case you have too little RAM installed. We'd recommend at least 8Gb for the current versions.

## Server fails to start with 'System.Management.ManagementException: Invalid class' error

The error you will see is

```
Description: The process was terminated due to an unhandled exception.
Exception Info: System.TypeInitializationException: The type initializer for
'CodeProject.AI.SDK.Common.SystemInfo' threw an exception.
---> System.Management.ManagementException: Invalid class
```

This is due to the WMI repository being corrupt. To repair the corrupted WMI do the following:

*   Open an Administrator Command or PowerShell window
*   run `winmgmt /verifyrepository`. If the repository has an issue, it will respond "repository is not consistent".
*   if the respository is inconsistent it needs to be repaired. run `winmmgmt /salvagerepository`
*   run `winmgmt /verifyrepository` again.
*   if it still reports the "respository in not consistent" then you might have to take drastic action and reset the repository. See the links below for details on how to do this, and the risks involved.

### See

*   [WMI: Repository Corruption, or Not?](https://techcommunity.microsoft.com/t5/ask-the-performance-team/wmi-repository-corruption-or-not/ba-p/375484).
*   [Winmgmt](https://learn.microsoft.com/en-us/windows/win32/wmisdk/winmgmt)

## Module fails to start

If you have a modest hardware setup then each module may require a little more time to start up before being able to proceed to loading the next module.

In the modulesettings.json file in each module's older is the setting `PostStartPauseSecs`. This specifies a pause between loading the given module and loading the next. Set it to 3 to 5 seconds if you modules are failing to load properly.

## Installation of FaceProcessing reports a urllib3 Error which can be ignored

While installing FaceProcessing, an error related to urllib3 is reported. This can be safetly ignored. It's something we're pondering how to address, but FaceProcessing should work just fine without it.

```
22:58:56:ObjectDetectionYolo: ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
22:58:56:ObjectDetectionYolo: botocore 1.29.142 requires urllib3<1.27,>=1.25.4, but you have urllib3 2.0.3 which is incompatible.
22:58:56:ObjectDetectionYolo: google-auth 2.19.0 requires urllib3<2.0, but you have urllib3 2.0.3 which is incompatible.
```

## UsbDk installation failing for ObjectDetection(Coral) 

If you're installing the UsbDk that's required for Coral USB, there is a known issue on Windows. The error will look something like: There is a problem with this Windows Installer package. A program run as part of the setup did not finish as expected. Contact your support personnel or package vendor.

To solve this, unpack the MSI to some subdirectory, like this:

```  title='Terminal'
cd c:\users\user\downloads
mkdir 122
msiexec /a UsbDk_1.0.22_x64.msi /qb TARGETDIR=%cd%\122
```

Open administrator command line. Go to the directory where the *usbdkcontroller.exe* is placed:

```  title='Terminal'
cd c:\users\user\downloads\122\USB Runtime Library etc
usbdkcontroller.exe -u
```

Reboot

```  title='Terminal'
usbdkcontroller.exe -i
```

## Windows 10 Update for .NET Framework (KB5034275) (KB5033918) (KB5034466) (KB5034582) affecting PowerShell, cuDNN

If you recently made a Windows 10 update and are finding that any external program that needs to call anything PowerShell is not working, and the script for cuDNN is not running, it could be a recent Windows 10 update issue. Particularly these updates:

January 9, 2024-KB5034275 Cumulative Update for .NET Framework 3.5, 4.8 and 4.8.1 for Windows 10 Version 22H2, (KB5033918) or (KB5034466), and January 23, 2024-KB5034582 Cumulative Update Preview for .NET Framework 3.5, 4.8 and 4.8.1 for Windows 10 Version 22H2.

Upgrading beyond these, or possibly uninstalling the update should resolve the issue.


## Object Detection fails: Unable to create YOLO detector for model

If you are attempting to use an Object Detection module and get

```
Object Detection (YOLO): Unable to create YOLO detector for model
```

Please go to *C:\Program Files\CodeProject\AI\modules\ObjectDetectionYolo\assets*. You should see a set of .pt files. If you do not, this means your installer failed.

To fix this, you need to re-install the module. Go to the **Install Modules** tab on your CodeProject.AI Server dashboard. Find the Object Detection module you are using, then click **Uninstall**. Then, once availabile, click **Install**.


## Errors regarding a module not starting, a package not found, something failing or shutting down

If you get any of the following errors while using a particular module:

```
Unable to load the model
Error trying to start
An error occurred trying to start process
ModuleNotFoundError: No module named
```

Please go to *C:\Program Files\CodeProject\AI\modules\[Module in question]* and look at *install.log*. This may point to the installation failing or something failing to be downloaded. If this is the case, you need to re-install the module. Go to the **Install Modules** tab on your CodeProject.AI Server dashboard. Find the module, then click **Uninstall**. Then, once availabile, click **Install**.


## ModuleNotFoundError: No module named 'PIL'

If you see this error:

```
ModuleNotFoundError: No module named 'PIL'
```

This means the module that threw the error wasn’t installed fully, most likely due to a timeout.

If this is the case, you need to re-install the module. Go to the **Install Modules** tab on your CodeProject.AI Server dashboard. Find the module, then click **Uninstall**. Then, once availabile, click **Install**.


## PaddlePaddle Install Issues / Blocking Domains

If you see this error:

```
ModuleNotFoundError: No module named 'paddle'
```

While not exclusive to PaddlePaddle, or the Optical Character Recognition module, and License Plate Reader module, an error like this could be indicative of domain blocking. PaddlePaddle, for instance, may come from Chinese domains and if you have Chinese IPs blocked, these modules won't be able to install.

To resolve this, temporarily allow the IPs you're restricting, and re-install the module.