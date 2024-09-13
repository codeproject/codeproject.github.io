---
title: Virtual Machines
tags:
  - Docker
---

# Proxmox

## ALPR installation issue on Proxmox

If you're installing CodeProject.AI Server on Windows running in a VM on a Proxmox host, and you see the following when installing the ALPR module you get the error

```
ALPR_adapter.py: Error: Your machine doesn't support AVX, but the
installed PaddlePaddle is avx core, you should reinstall paddlepaddle with no-avx core.
```

You may need to change the CPU type in Proxmox to "Host" which to expose the AVX instruction set. To do so, click on the VM and shut it down. Then click Hardware - > Processors -> Edit - > and set type to Host.

The other option is to create specific CPU models and then add the appropriate flags you desire to those models as documented in the Proxmox manual here: [Manual: cpu-models.conf - Proxmox VE](https://pve.proxmox.com/wiki/Manual:_cpu-models.conf).