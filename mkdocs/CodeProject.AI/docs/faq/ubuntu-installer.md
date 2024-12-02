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

## Error `E: Repository 'https://packages.cloud.google.com/apt coral-edgetpu-stable InRelease' changed its 'Origin' value` occurs because the repository metadata has changed, and the package manager requires confirmation to trust the updated information.

1. **Update the Repository Information**
   Force the system to trust the new repository metadata by running:
   ```bash
   sudo apt-get update --allow-releaseinfo-change
   ```

2. **Verify the Repository Configuration**
   Ensure that the repository is correctly configured in your `sources.list` or `sources.list.d` directory. For example:
   ```bash
   cat /etc/apt/sources.list.d/coral-edgetpu.list
   ```
   Confirm that the URL and distribution are correct. The entry should look something like:
   ```
   deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt coral-edgetpu-stable main
   ```

3. **Remove Any Cached Data**
   If the error persists, clear the cached repository data and re-run the update:
   ```bash
   sudo rm -rf /var/lib/apt/lists/*
   sudo apt-get update
   ```

4. **Re-import the GPG Key (if necessary)**
   If the repository’s GPG key has also changed or is missing, re-import it:
   ```bash
   curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
   ```

5. **Run the Update and Upgrade**
   Finally, update and upgrade your system:
   ```bash
   sudo apt-get update
   sudo apt-get upgrade
   ```

These steps should resolve the issue.