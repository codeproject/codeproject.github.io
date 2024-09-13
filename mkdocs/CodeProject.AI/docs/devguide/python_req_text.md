---
title: Python requirements.txt files
tags:
  - server
  - install
---


# Python requirements.txt files

There is no "one-size-fits-all" for Python packages. The Operating system, 
hardware, libraries, the version of Python and many more things factor into what
packages can and should be installed.

To provide full coverage for all the possibilities there are two tactics. First,
you can install python modules directly via the `install` script. The `installPythonPackagesByName` provides an easy way to achieve this.

Second, you can provide system specific `requirements.txt` files, with the installer
choosing the correct one at install time. The files are named based on device,
OS, architecture, GPU type, and optionally CUDA library type.

The order of preference for choosing a requirements file is as follows.

 - requirements.device.txt
 - requirements.os.architecture.cudaMajor_Minor.txt
 - requirements.os.architecture.cudaMajor.txt
 - requirements.os.architecture.(cuda|rocm).txt
 - requirements.os.cudaMajor_Minor.txt
 - requirements.os.cudaMajor.txt
 - requirements.os.(cuda|rocm).txt
 - requirements.cudaMajor_Minor.txt
 - requirements.cudaMajor.txt
 - requirements.(cuda|rocm).txt
 - requirements.os.architecture.gpu.txt
 - requirements.os.gpu.txt
 - requirements.gpu.txt
 - requirements.os.architecture.txt
 - requirements.os.txt
 - requirements.txt


Specifiers:

 - **device** is one of raspberrypi, orangepi or jetson. 
 - **os** is linux, macos, or windows
 - **architecture** is x86_64 or arm64
 - **cudaMajor_Minor** is the major/minor version of CUDA currently installed (eg cuda12.2).
 - **cudaMajor** is just the major version (eg cuda12).
 - **rocm** refers to AMD ROCm GPU support, and **cuda** refers to NVIDIA CUDA support. 
 - **gpu** is a generic identifier meaning "use if GPU support is enabled, but no CUDA or ROCm GPUs have been detected". This is great for packages that support multiple GPUs such as OpenVINO and DirectML.

As an example, `requirements.linux.arm64.cuda11_7.txt` would be a requirements file specifically for Linux on arm64 systems, targeting CUDA 11.7. `requirements.windows.gpu.txt` would be for targeting Windows where a GPU was found. If, in this case, no GPU was found but there was a `requirements.windows.txt` file, then that would be used as a fallback. It's wise to always provide a generic, safe `requirements.txt` fallback.
