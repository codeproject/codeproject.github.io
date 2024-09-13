---
title: Mesh
tags:
  - Mesh
---

## Windows doesn't see both PCs

If you're trying to use CodeProject.AI Server Mesh with a Windows 10 machine, you may encounter networking issues, where CodeProject.AI Server Mesh doesn't pick up the Window 10 machine. There is a networking fix for this, whereby you change the network priority of the Windows connection. 

To do this, open up Control Panel, select **Network and Sharing Center** > **Change Adapter Settings**, then right-click on whatever adapter you want to set as your priority conncetion, and select **Properties**. Select **Internet Protocol Version 4 (TCP/IPv4)**, then hit **Properties** > **Advanced**, uncheck **Automatic metric**, then within the **Interface metric** field put in "10", hit **OK**, **OK**, then restart your computuer.

This comes from the video [How to Change Network Priority of Connection on Windows 11](https://www.youtube.com/watch?v=-1wLJaS4f_o) if you prefer a visual aid.