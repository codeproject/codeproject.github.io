---
title: Jetson Nano Dev Kit
tags:
  - Jetson
---

## dpkg: error processing package nvidia-l4t-bootloader (--configure)

You may see this error, or something similar, while trying to install VS Code (or anything else) on the Jetson

```
Setting up nvidia-l4t-bootloader (32.7.1-20220219090432) ...
3448-300---1--jetson-nano-qspi-sd-mmcblk0p1
Starting bootloader post-install procedure.
ERROR. Procedure for bootloader update FAILED.
Cannot install package. Exiting...
dpkg: error processing package nvidia-l4t-bootloader (--configure):
 installed nvidia-l4t-bootloader package post-installation script subprocess returned error exit status 1
Processing triggers for libc-bin (2.27-3ubuntu1.3) ...
Errors were encountered while processing:
 nvidia-l4t-bootloader
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

To resolve, try the following (with thanks to Carlos on the [NIVIDIA forums](https://forums.developer.nvidia.com/t/solution-dpkg-error-processing-package-nvidia-l4t-bootloader-configure/208627)).The issue is related to the information that dpkg saves. To do a hacky fix we'll move the dpkg info to a backup, update and reinstall dpkg packages, and then copy back the info we backed up. This will correct corrupted the information that had been stored

1. Backup `/var/lib/dpkg/info`

```  title='bash'
sudo mv /var/lib/dpkg/info/ /var/lib/dpkg/backup/
sudo mkdir /var/lib/dpkg/info/
```

2. Update the repos and force install

```  title='bash'
sudo apt-get update
sudo apt-get -f install
```

3. Copy the corrected dpkg/info files over our old backup

```  title='bash'
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/backup/
```

4. Remove the new info and copy our backup (with corrected info) back into place

```  title='bash'
sudo rm -rf /var/lib/dpkg/info
sudo mv /var/lib/dpkg/backup/ /var/lib/dpkg/info/
```

Things should now work properly.