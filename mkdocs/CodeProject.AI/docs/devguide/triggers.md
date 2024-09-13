---
title: Adding Triggers to CodeProject.AI Server
tags:
  - server
  - triggers
---


# Adding Triggers to CodeProject.AI Server

Running an AI inference operation on a piece of data to get predictions on the form or content of
the data is one thing, but ultimately one wants to be able to act on those predictions.

Typically this is done via the API. A client application sends an image, for instance, to an
object detection or classification module and, based on the response for the server, that client
will then take (or not take) appropriate action.

Sometimes, though, you just want something simple, like calling a script or a shell command. For
this you can use Triggers. 

Triggers are defined in the /Server/FrontEnd/triggers.json file. An example is

``` json
{
  "Queue"                     : "objectdetection_queue",
  "PredictionsCollectionName" : "predictions",
  "PropertyName"              : "label",
  "PropertyValue"             : "car",
  "PropertyComparison"        : "equals",
  "Confidence"                : 0.5,
  "ConfidenceComparison"      : "greaterthan",
  "PlatformTasks" : {
    "Windows" : { 
      "Command": "cmd",
      "Args": "/c echo Hi Windows. I see a car",
      "Type": "Command"
    },
    "Linux" : {
      "Command": "bash",
      "Args": "echo Hi Linux. I see a car",
      "Type": "Command"
    },
    "LinuxArm64" : {
      "Command": "bash",
      "Args": "echo Hi Linux. I see a car",
      "Type": "Command" 
    },
    "macOS" : {
      "Command": "zsh",
      "Args": "echo Hi Linux. I see a car",
      "Type": "Command"
    },
  }
}
```

When an inference occurs, a response from the AI module is returned to the server on the same queue that the request was placed. Each queue can
be watched individually to avoid undue processing.

When a response comes back, the payload of that response is checked to see
if any trigger conditions are met. The trigger conditions are as follows:

| Condition            | Explanation               |
|----------            |-------               |
| Queue                | The queue to watch        |
| PropertyName         | The name of the property in the response to check |
| PropertyValue        | The value of the property in the response to check.  |
| PropertyComparison   | The property value comparison method. This is the operation used to compare the `PropertyValue` with the value of the `PropertyName` property in the response. See below for comparison types.
| PredictionsCollectionName | If specified, the system will look for a collection with this name, and apply the `PropertyName` / `PropertyValue` checks on each object in that collection, rather than looking for a property `PropertyName` at the root of the response object    |
| Confidence           | The confidence value to compare to the confidence score returned by the inference|
| ConfidenceComparison | The confidence comparison method. This is the operation used to compare the `Confidence` value with the confidence score returned by the inference |
| PlatformTasks | A set of tasks to perform depending on platform. See below|

The Comparison method can be one of 

 - Equals
 - LessThan
 - LessThanOrEquals
 - GreaterThan
 - GreaterThanOrEquals
 - NotEquals

Suppose we wanted to watch the queue named `objectdetection_queue` and we were interested in spotting results with a label of 'car' with a confidence of at least 80%. This would translate to

``` json
{
  "Queue"                     : "objectdetection_queue",
  "PropertyName"              : "label",
  "PropertyValue"             : "car",
  "PropertyComparison"        : "equals",
  "Confidence"                : 0.8,
  "ConfidenceComparison"      : "greaterthanorequals",
  ...
}
```
Suppose, however, our object detection module returns a collection of objects it has found, in the the `predictions` collection. Each item in that collection has a label and confidence. We would simply provide a `PredictionsCollectionName` value:

``` json
{
  "Queue"                     : "objectdetection_queue",
  "PredictionsCollectionName" : "predictions",
  "PropertyName"              : "label",
  "PropertyValue"             : "car",
  "PropertyComparison"        : "equals",
  "Confidence"                : 0.8,
  "ConfidenceComparison"      : "greaterthanorequals",
  ...
}
```

If a trigger condition for the given queue is met, then the task for the given platform will be executed. Tasks are listed under the `PlatformTasks` collection, with each platform having its own entry. 

``` json
{
  "Queue"                     : "objectdetection_queue",
  "PredictionsCollectionName" : "predictions",
  "PropertyName"              : "label",
  "PropertyValue"             : "car",
  "PropertyComparison"        : "equals",
  "Confidence"                : 0.8,
  "ConfidenceComparison"      : "greaterthanorequals",
  
  "PlatformTasks" : {
    "Windows" : { 
      "Command": "cmd",
      "Args": "/c echo Hi Windows. I see a car",
      "Type": "Command"
    },
    "Linux" : {
      "Command": "bash",
      "Args": "echo Hi Linux. I see a car",
      "Type": "Command"
    }
  }
}
```

Supported platforms are

- Windows
- WindowsArm64
- Linux
- LinuxArm64
- MacOS
- MacOSArm64

| Task Property   | Explanation |
|----------            |-------               |
| Command | The command that will be executed on the given platform |
| Args    | The arguments to supply to that command |
| Type    | The type of command. Currently only "Command" is supported |
|         |                |
