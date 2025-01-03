﻿---
title: Installing CodeProject.AI Server on macOS
tags:
  - CodeProject.AI
  - macOS
---

# Installing CodeProject.AI Server on macOS

To **install CodeProject.AI** as a standalone service ready for integration with applications such as HomeAssist or BlueIris on macOS, download the 
[latest installation package](https://codeproject.github.io/codeproject.ai/latest.html) for macOS.

Unzip and double click the .pkg package. This will install the server as a Login Item. CodeProject.AI
Server and the backend analysis services will run each time you log in. 

To manually start the service, double click on `CodeProject.AI Server.command` in the
`/Library/CodeProject.AI Server/2.9.1/` folder (replace 2.9.1 with the version you currently have
installed).

To **explore CodeProject.AI** Click on the CodeProject.AI Explorer link at the top of the server dashboard. 


## Accessing the CodeProject.AI Server Dashboard.
Open a browser and navigate to [http://localhost:32168](http://localhost:32168) to open the
CodeProject.AI Dashboard.  This will provide you with details of the server operation.

## Play with the Server
We provide a sample application written in HTML and JavaScript that performs various AI operations.
Open [http://localhost:32168/explorer.html](http://localhost:32168/explorer.html) in a browser. 
There is also a link to this at the top of the Dashboard.

## To uninstall CodeProject.AI.

To uninstall CodeProject.AI Server run

```bash
sudo bash '/Library/CodeProject.AI Server/2.9.1/uninstall.sh'
```
Replace the version (2.9.1) with the version of the server you wish to uninstall.
