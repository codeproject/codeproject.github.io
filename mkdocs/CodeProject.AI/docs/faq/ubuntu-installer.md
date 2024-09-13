---
title: Ubuntu / WSL
tags:
  - Ubuntu
---

## Error saying you need to install .NET

In Ubuntu or WSL, if you have .NET 7 installed and you try and build, there may be an error saying you need to install .NET.

The easiest fix is to simply reinstall .NET by removing .NET, delete the PMC repository from APT by deleting the repo .list file, then reinstalling the .NET SDK

```shell  title='bash'
sudo apt remove 'dotnet*'
sudo apt remove 'aspnetcore*'
sudo rm /etc/apt/sources.list.d/microsoft-prod.list 
sudo apt update
sudo apt install dotnet-sdk-7.0
```