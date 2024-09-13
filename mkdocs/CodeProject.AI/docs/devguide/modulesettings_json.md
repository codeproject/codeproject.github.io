---
title: The ModuleSettings files
tags:
  - settings
---

# The Module Settings files

The way a module is installed, launched, and managed is defined in the modulesettings.json file or
files for that module. You can create a separate modulesettings file for each device, operating system, architecture or
GPU combo you need to support. See [Module Settings](../api/module_settings.md) for more information.

Assuming we're labelling our module as **DemoModulePython**, the basic format of a settings file will be:

``` JSON
{
  "Modules": {

    "DemoModulePython": {
      "Name": "My module name",
      "Version": "2.0.0",

      "PublishingInfo" : {
         ...
      },

      "LaunchSettings": {
         ...
      },

      "EnvironmentVariables": {
         ...
      },

      "GpuOptions" : {
         ...
      },

      "InstallOptions" : {
         ...
      },

      "UIElements" : {
         ...
      },

      "RouteMaps": [
      {
         ...
      }]
    }
  }
}
```

Let's walk through this and fill in the values.

**Name** and **version** should be self explanatory, and the module ID is any ID you wish to provide that doesn't conflict with another module. We're labelling our module as DemoModulePython.

Our **PublishingInfo** section will contain:
``` JSON
"PublishingInfo" : {
  "Description" : "Provides Object Detection YOLOv8",
  "Category"    : "Computer Vision",
  "Stack"       : "Python, PyTorch, YOLO",
  "License"     : "AGPL-3.0",
  "LicenseUrl"  : "https://www.gnu.org/licenses/agpl-3.0.en.html",
  "Author"      : "Chris Maunder",
  "Homepage"    : "https://codeproject.com/ai",
  "BasedOn"     : "ultralytics",                         // What project is this based on?
  "BasedOnUrl"  : "https://github.com/ultralytics/ultralytics" // The URL for that project
}
```

The **LaunchSettings** will contain

``` JSON
"LaunchSettings": {
  "AutoStart"          : true,                // Start this when the server starts
  "FilePath"           : "detect_adapter.py", // Name of file that gets launched  
  "Runtime"            : "python3.8",         // file is launched by Python
  "RuntimeLocation"    : "Local",             // We want our own virt. env., not a shared one
  "PostStartPauseSecs" : 1,                   // Generally 1 if using GPU, 0 for CPU
  "Queue"              : "objdetect_queue",   // Can be left as null if you wish
  "Parallelism"        : 0                    // 0 = Default (number of CPUs - 1)
}
```

- **FilePath** and **Runtime** are the most important fields here. Everything else can be omitted if you wish.
- **Queue** specifies where the server will place requests from clients, and the name of the queue that the module will be looking in for requests to process. You can leave this blank, or you can provide a name in case you wish to have multiple modules service the same queue.
- Parallelism denotes the number of parallel tasks that will be running to service this queue.
- RuntimeLocation is currently only used for Python, and can be "shared", meaning this module will use a shared virtual environment to save space, or "local" meaning the venv will be local to this module (to avoid package conflicts)

The **EnvironmentVariables** section contains any environment variables we wish to have set before launch

``` JSON
"EnvironmentVariables": {
  "MODEL_SIZE" : "Medium",   // tiny, small, medium, large
  "MODELS_DIR" : "%CURRENT_MODULE_PATH%/assets"
}
```

Note the use of the `CURRENT_MODULE_PATH` macro. See [Macros](../api/module_settings.md#macros-for-settings) for more information on this.

**GpuOptions** is solely for GPU setup

``` JSON
"GpuOptions": {
  "InstallGPU"            : true,    // Should we install GPU enabled code?
  "EnableGPU"             : true,    // Should we enable GPU support (if installed)
  "AcceleratorDeviceName" : null,    // eg "cuda:0" or just leave blank for default
  "HalfPrecision"         : "enable" // For code that supports half-precision. Use 'Force', 'Enable', 'Disable'
}
```
 
 - **HalfPrecision** allows you to disable half precision operations on older CUDA cards that don't support it. It's generally safe to omit this because CodeProject.AI server can make some educated guesses on your behalf

**InstallOptions** describe how and where and if the module should or could be installed

``` JSON
"InstallOptions": {
  "Platforms":      [ "windows", "linux" ], 
  "ModuleReleases": [ 
      { "ModuleVersion": "1.0.0", "ServerVersionRange": [ "1.0.0", "2.4.9" ],
        "ReleaseDate": "2023-01-01", "ReleaseNotes": "Initial Release", 
        "Importance": "Major" },
     { "ModuleVersion": "2.0.0", "ServerVersionRange": [ "2.5.0", "" ],
       "ReleaseDate": "2023-02-14", "ReleaseNotes": "Updated for Server 2.5.0",
       "Importance": "Major" } 
  ]
}
```

- **Platforms** is a list of platforms. Supported options are: windows, macos, linux, raspberrypi, orangepi, jetson, plus the arm64 variants: windows-arm64, macos-arm64, linux-arm64. Or, use "all" to signify it can run anywhere.
- **ModuleReleases** is an array of versions and the server versions it's compatible with. In this case version 1 was compatible with CodeProject.AI Server version 1 to 2.4.9, and version 2 of the module is compatible with CodeProject.AI version 2.5 and above

**UIElements** provides the server with information on UI options. We'll only discuss the context menu that appears on a module's row in the dashboard.  We'll provide a single menu that offers model size.

``` JSON
"UIElements" : {
  "Menus": [{
     "Label": "Half Precision",
     "Options": [
       { "Label": "Force on",    "Setting": "CPAI_HALF_PRECISION", "Value": "force"   },
       { "Label": "Use Default", "Setting": "CPAI_HALF_PRECISION", "Value": "enable"  },
       { "Label": "Disable",     "Setting": "CPAI_HALF_PRECISION", "Value": "disable" }
     ]
  }]
},
```
Adding a second menu option is as is simple as adding another menu object (`{ "Label": .... "Options": ...}`)

**RouteMaps** are what define the API route for your module.

``` JSON
"RouteMaps": [{
  "Name": "Python YOLOv8 Object Detector",
  "Route": "vision/detection",
  "Method": "POST",
  "Command": "detect",
  "Description": "Detects objects",

  "Inputs": [
    {
      "Name": "image",
      "Type": "File",
      "Description": "The HTTP file object (image) to be analyzed."
    },
    {
      "Name": "min_confidence",
      "Type": "Float",
      "Description": "The minimum confidence level (0.0 - 1.0) for an object will be detected.",
      "DefaultValue": 0.4,
      "MinValue": 0.0,
      "MaxValue": 1.0
    }],

  "Outputs": [{
    "Name": "success",
    "Type": "Boolean",
    "Description": "True if successful."
    },
    ... 
  ]
 }
]
```

- **Route** is route a caller will use to call this module. The route vision/detection will correspond to the API call http://localhost:32168/v1/vision/detection
- **Command** is the command that will be sent to this route. You can setup routes that go to the same path but send different commands. It's up to your module to handle the command appropriately
- **Inputs** and **Outputs** define the input parameters and output results and are used for automatically documenting your module

### Adding a variant modulesettings file

Suppose you wished to provide a different setting for a module when it runs on, say, Windows. For example
you may wish to use Python 3.9 for Windows. Just create a variant of the modulesettings with a file name
the ensures it is selected only for Windows (See [module settings files](../api/module_settings.md) for 
information). In this case `modulesettings.windows.json` will work for a general Windows install, and
we only need override the values we wish to change:

```JSON
{
  "Modules": {
    "MyModuleId": {
      "LaunchSettings": {
        "Runtime": "python3.9"
      }
    }
  }
}
```