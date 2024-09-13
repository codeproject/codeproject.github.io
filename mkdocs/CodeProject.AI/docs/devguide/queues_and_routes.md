---
title: Adding Triggers to CodeProject.AI Server
tags:
  - server
  - Queues
  - Routes
---


# Queues and Routes in CodeProject.AI Server


To make a request to CodeProject.AI server you send your request to a specific API endpoint on the server. For example, `http://localhost:32168/v1/vision/custom/ipcam-general`, using POST. This route identifies the API version (v1), the module (vision), the command (custom), and a parameter (ipcam-general). For CodeProject.AI Server we refer to the `v1/vision/detect` part as the <I>path</i>, `vision/custom` as the <i>route</i>, and `ipcam-general`, as mentioned earlier, as the parameter. There may be more than 1 parameter.

The server takes the data sent with the request and places that request on a queue defined by the module that has that route.

Each module defines its own routes and queue names. The server determines which queue to use by searching all modules that service that route, and selects the queue name of the first module it finds that services that route. This means it's very important to (a) keep your routes unique between modules, and (b) keep queue names unique between modules. By default the queue name is just the module's ID with a '_queue' suffix.

We've made an exception for the ObjectDetection modules. We have all Object detection modules use the same queue and the same routes. This allows you to start any Object detection module and have integrations like Agent DVR or Blue Iris work with any of them without the need to make any changes. Please note, however, that we recommend only having one Object detection module running at once.

It's easy enough to modify the modulesettings files in each module to change this. You just define a separate route for each, and assign the, a separate queue. You then call the API using the route for the given module.

You can have two modules running at the same time that share the same queue. The request from the client will be handled by which ever module happened to get to the queue first.

Alternatively, and to sow confusion, you could have modules have different queues, but share the same route. The server places requests on the queue specified by the route that matches that queue. This search is deterministic, though, so the same module's queue would always be selected. This means only the module servicing the selected queue will get the request, even though the other has the same route as the first.

