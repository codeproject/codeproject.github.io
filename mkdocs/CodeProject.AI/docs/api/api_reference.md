---
title: API Reference
tags:
  - api
---


# API reference

The API for CodeProject.AI is divided into categories Image, Vision, Text, and Status with
each category further broken into sub-topics.

This document will continually change and be updated to reflect the latest
server version and installed analysis modules


## Computer Audition

### Sound Classifier

Classify sound files based on the UrbanSound8K dataset.

``` title=''
POST: http://localhost:32168/v1/sound/classify
```

**Platforms**

All

**Parameters**

 - **sound** (File): The HTTP file object (WAV sound file) to be analyzed.

 - **min_confidence** (Float): The minimum confidence level for successful classification. In the range 0.0 to 1.0. Default 0.4.
   *Optional*. Defaults to 0.4

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "label": (Text) // The classification label of the sound.
  "confidence": (Float) // The confidence in the classification in the range of 0.0 to 1.0.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('sound', fileChooser.files[0]);
formData.append("min_confidence", 0.4);

var url = 'http://localhost:32168/v1/sound/classify';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("label: " + data.label)
                   console.log("confidence: " + data.confidence.toFixed(2))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Computer Vision

### License Plate Reader

Detects and reads the characters in license plates detected within an image

``` title=''
POST: http://localhost:32168/v1/vision/alpr
```

**Platforms**

All

**Parameters**

 - **upload** (File): The image to ALPR.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object[]) // An array of objects with the x_max, x_min, max, y_min bounds of the plate, label, the plate chars and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('upload', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/vision/alpr';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + (nothing returned))
                   console.log("count: " + data.count)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### License Plate Reader, Legacy route

Detects the characters in license plates detected within an image

``` title=''
POST: http://localhost:32168/v1/image/alpr
```

**Platforms**

All

**Parameters**

 - **upload** (File): The image to ALPR.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object[]) // An array of objects with the x_max, x_min, max, y_min bounds of the plate, label, the plate chars and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('upload', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/image/alpr';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + (nothing returned))
                   console.log("count: " + data.count)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### License Plate Reader RKNN

Detects the characters in license plates detected within an image

``` title=''
POST: http://localhost:32168/v1/vision/alpr
```

**Platforms**

Orangepi

**Parameters**

 - **upload** (File): The image to ALPR.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object[]) // An array of objects with the x_max, x_min, max, y_min bounds of the plate, label, the plate chars and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('upload', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/vision/alpr';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + (nothing returned))
                   console.log("count: " + data.count)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### License Plate Reader RKNN, legacy route

Detects the characters in license plates detected within an image

``` title=''
POST: http://localhost:32168/v1/image/alpr
```

**Platforms**

Orangepi

**Parameters**

 - **upload** (File): The image to ALPR.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object[]) // An array of objects with the x_max, x_min, max, y_min bounds of the plate, label, the plate chars and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('upload', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/image/alpr';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + (nothing returned))
                   console.log("count: " + data.count)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Detection

### Object Detection

Detects multiple objects in an image using the standard YOLOv5 models trained
on the COCO image sets.

``` title=''
POST: http://localhost:32168/v1/vision/detection
```

The object detection module uses YOLO (You Only Look Once) to locate and 
classify the objects the models have been trained on. At this point there are 
80 different types of objects that can be detected:

 - person
 - bicycle, car, motorbike, aeroplane, bus, train, truck, boat
 - traffic light, fire hydrant, stop sign, parking meter, bench
 - cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe
 - backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sports ball, kite, baseball bat, baseball glove, skateboard, surfboard, tennis racket
 - bottle, wine glass, cup, fork, knife, spoon, bowl
 - banana, apple, sandwich, orange, broccoli, carrot, hot dog, pizza, donut, cake
 - chair, sofa, pottedplant, bed, diningtable, toilet, tvmonitor, laptop, mouse, remote, keyboard, cell phone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddy bear, hair drier, toothbrush

**Platforms**

Windows, Linux, macOS, macOS-Arm, Docker

**Parameters**

 - **image** (File): The HTTP File Object (image) to be analyzed.

 - **min_confidence** (Float): The minimum confidence level for an object will be detected. In the range 0.0 to 1.0. Default 0.4.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object) // An array of objects with the x_max, x_min, max, y_min, label and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```

#### Example

=== "Python"

    ``` python title=''
    import requests

    image_data = open("my_image.jpg","rb").read()

    response = requests.post("http://localhost:32168/v1/vision/detection",
                             files={"image":image_data}).json()

    for object in response["predictions"]:
        print(object["label"])

    print(response)
    ```

=== "Javscript"


    ```javascript
    // Assume we have a HTML INPUT type=file control with ID=fileChooser
    var formData = new FormData();
    formData.append('image', fileChooser.files[0]);
    formData.append("min_confidence", 0.4);

    var url = 'http://localhost:32168/v1/vision/detection';

    fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + JSON.stringify(data.predictions))
                   console.log("count: " + data.count)
                   console.log("command: " + data.command)
                   console.log("moduleId: " + data.moduleId)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
    ```



**Response**

``` text title=''
dog
person
person
{'predictions': [ {'x_max': 600, 'x_min': 400, 'y_min': 200, 'y_max': 400,
   'confidence': 95, 'label': 'car' },{'x_max': 100, 'x_min': 200, 'y_min': 50,
   'y_max': 100, 'confidence': 90, 'label': 'dog' },], 'success': True}
```


### Custom Object Detector

Detects objects based on a custom model. 

There are multiple OBject Detection modules available, and each module will store its own set of
custom models. Use the [List Models API](#custom-object-detector-list-models) to list the models that a given module supports.

To make a call to a specific model use /vision/custom/model-name, where 'model-name' is the name of the model file (without the file extension)

``` title=''
POST: http://localhost:32168/v1/vision/custom/model-name
```

The object detection modules generally use YOLO (You Only Look Once) to locate and 
classify the objects the models have been trained on. The custom models 
included by default are

  - ipcam-animal - bird, cat, dog, horse, sheep, cow, bear, deer, rabbit, raccoon, fox, skunk, squirrel, pig
  - ipcam-dark - Bicycle, Bus, Car, Cat, Dog, Motorcycle, Person
  - ipcam-general - person, vehicle, plus objects in ipcam-dark
  - ipcam-combined - person, bicycle, car, motorcycle, bus, truck, bird, cat, dog, horse, sheep, cow, bear, deer, rabbit, raccoon, fox, skunk, squirrel, pig

The exception is the Tensorflow-Lite module which does not (yet) offer custom models.

**Platforms**

All

**Parameters**

 - **image** (File): The HTTP file object (image) to be analyzed.

 - **min_confidence** (Float): The minimum confidence level for an object will be detected. In the range 0.0 to 1.0. Default 0.4.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object) // An array of objects with the x_max, x_min, max, y_min, label and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("min_confidence", 0.0);

// Assumes we have licence-plates.pt in the /assets dir
var url = 'http://localhost:32168/v1/vision/custom/licence-plates';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("predictions: " + JSON.stringify(data.predictions))
                   console.log("count: " + data.count)
                   console.log("command: " + data.command)
                   console.log("moduleId: " + data.moduleId)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```




### Custom Object Detector List Models

Returns a list of models available.

``` title=''
POST: http://localhost:32168/v1/vision/custom/list
```

**Platforms**

All

**Parameters**

(None)

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object) // An array of objects with the x_max, x_min, max, y_min, label and confidence.
  "count": (Integer) // The number of objects found.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript

var url = 'http://localhost:32168/v1/vision/custom/list';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("models: " + data.models)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```

### Scene Classifier

Classifies the scene in an image. It can recognise 365 different scenes.

``` title=''
POST: http://localhost:32168/v1/vision/scene
```

**Platforms**

All, !Linux, !Raspberrypi, !Jetson

**Parameters**

 - **image** (File): The HTTP file object (image) to be analyzed.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "label": (Text) // The classification of the scene such as 'conference_room'.
  "confidence": (Float) // The confidence in the classification in the range of 0.0 to 1.0.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/vision/scene';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("label: " + data.label)
                   console.log("confidence: " + data.confidence.toFixed(2))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Face Recognition

### Face Detection

Detects faces in an image and returns the coordinates of the faces.

``` title=''
POST: http://localhost:32168/v1/vision/face
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

 - **image** (File): The HTTP File Object (image) to be analyzed.

 - **min_confidence** (Float): The minimum confidence level for an object will be detected. In the range 0.0 to 1.0.
   *Optional*. Defaults to 0.4

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "message": (String) // A summary of the inference operation.
  "error": (String) // (Optional) An description of the error if success was false.
  "predictions": (Object) // An array of objects with the x_max, x_min, max, y_min, label and confidence.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("min_confidence", 0.4);

var url = 'http://localhost:32168/v1/vision/face';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("message: " + data.message)
                   console.log("error: " + data.error)
                   console.log("predictions: " + JSON.stringify(data.predictions))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Face Comparison

Compares two faces in two images and returns a value indicating how similar the faces are.

``` title=''
POST: http://localhost:32168/v1/vision/face/match
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

 - **image1** (File): First HTTP File Object (image) to be analyzed.

 - **image2** (File): Second HTTP File Object (image) to be analyzed.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "similarity": (Float) // How similar the two images are, in the range of 0.0 to 1.0.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image1', fileChooser.files[0]);
formData.append('image2', fileChooser.files[1]);

var url = 'http://localhost:32168/v1/vision/face/match';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("similarity: " + data.similarity.toFixed(2))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### List Registered Faces

Lists the users that have images registered in the Face Recognition database.

``` title=''
POST: http://localhost:32168/v1/vision/face/list
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

(None)

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "faces": (Object) // An array of the userid strings for users with registered images.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript

var url = 'http://localhost:32168/v1/vision/face/list';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("faces: " + JSON.stringify(data.faces))
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Register Face

Registers one or more images for a user for recognition. This trains the face recognition model and allows the face recognition to report back a userId based on an image you supply that may or may not contain that user's face.

``` title=''
POST: http://localhost:32168/v1/vision/face/register
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

 - **imageN** (File): The one or more HTTP File Objects (images) to be registered.

 - **userid** (Text): The identifying string for the user.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "Message": (Text) // face added
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('imageN', fileChooser.files[0]);
formData.append("userid", '');

var url = 'http://localhost:32168/v1/vision/face/register';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("Message: " + data.Message)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Delete Registered Face

Removes a userid and images from the Face Registration database.

``` title=''
POST: http://localhost:32168/v1/vision/face/delete
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

 - **userid** (Text): The identifying string for the user.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("userid", '');

var url = 'http://localhost:32168/v1/vision/face/delete';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Face Recognition

Recognizes all faces in an image and returns the userId and coordinates of each face in the image. If a new (unregistered) face is detected then no userid for that face will be returned.

``` title=''
POST: http://localhost:32168/v1/vision/face/recognize
```

**Platforms**

All, !Raspberrypi, !Jetson

**Parameters**

 - **image** (File): The HTTP file object (image) to be analyzed.

 - **min_confidence** (Float): The minimum confidence level for an object will be detected. In the range 0.0 to 1.0.
   *Optional*. Defaults to 0.4

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "predictions": (Object) // An array of objects with the userid, x_max, x_min, max, y_min, label and confidence.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("min_confidence", 0.4);

var url = 'http://localhost:32168/v1/vision/face/recognize';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("predictions: " + JSON.stringify(data.predictions))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Image Processing

### Background Remover

Removes the background from behind the main subjects in images.

``` title=''
POST: http://localhost:32168/v1/image/removebackground
```

**Platforms**

All, !Linux, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **image** (File): The image to have its background removed.

 - **use_alphamatting** (Boolean): Whether or not to use alpha matting.
   *Optional*. Defaults to false

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "imageBase64": (Base64ImageData) // The base64 encoded image that has had its background removed.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("use_alphamatting", false);

var url = 'http://localhost:32168/v1/image/removebackground';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   // Assume we have an IMG tag named img1
                   img1.src = "data:image/png;base64," + data.imageBase64;
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Cartooniser

Convert a photo into an anime style cartoon.

``` title=''
POST: http://localhost:32168/v1/image/cartoonise
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **image** (File): The image to be converted.

 - **model** (String): Name of the model to use

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "imageBase64": (Base64ImageData) // The base64 encoded image.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("model", );

var url = 'http://localhost:32168/v1/image/cartoonise';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   // Assume we have an IMG tag named img1
                   img1.src = "data:image/png;base64," + data.imageBase64;
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Portrait Filter

Blurs the background behind the main subjects in an image.

``` title=''
POST: http://localhost:32168/v1/image/portraitfilter
```

**Platforms**

Windows

**Parameters**

 - **image** (File): The image to be filtered.

 - **strength** (Float): How much to blur the background (0.0 - 1.0).
   *Optional*. Defaults to 0.5

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "filtered_image": (Base64ImageData) // The base64 encoded image that has had its background blurred.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);
formData.append("strength", 0.5);

var url = 'http://localhost:32168/v1/image/portraitfilter';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   // Assume we have an IMG tag named img1
                   img1.src = "data:image/png;base64," + data.filtered_image;
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Super Resolution

Increases the resolution of an image using AI to ensure no bluriness is introduced.

``` title=''
POST: http://localhost:32168/v1/image/superresolution
```

**Platforms**

All

**Parameters**

 - **image** (File): The image to have its resolution increased.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "imageBase64": (Base64ImageData) // The base64 encoded image that has had its resolution increased.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
// Assume we have a HTML INPUT type=file control with ID=fileChooser
var formData = new FormData();
formData.append('image', fileChooser.files[0]);

var url = 'http://localhost:32168/v1/image/superresolution';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   // Assume we have an IMG tag named img1
                   img1.src = "data:image/png;base64," + data.imageBase64;
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Natural Language

### Sentiment Analysis

Determines if the supplied text has a positive or negative sentiment

``` title=''
POST: http://localhost:32168/v1/text/sentiment
```

**Platforms**

Windows, macOS

**Parameters**

 - **text** (Text): The text to be analyzed.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "is_positive": (Boolean) // Whether the input text had a positive sentiment.
  "positive_probability": (Float) // The probability the input text has a positive sentiment.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and text manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("text", '');

var url = 'http://localhost:32168/v1/text/sentiment';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("is_positive: " + data.is_positive)
                   console.log("positive_probability: " + data.positive_probability.toFixed(2))
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Text Summary

Summarizes some content by selecting a number of sentences that are most representative of the content.

``` title=''
POST: http://localhost:32168/v1/text/summarize
```

**Platforms**

All

**Parameters**

 - **text** (Text): The text to be summarized

 - **num_sentences** (Integer): The number of sentences to produce.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "summary": (Text) // The summarized text.
  "inferenceMs": (Integer) // The time (ms) to perform the AI inference.
  "processMs": (Integer) // The time (ms) to process the image (includes inference and image manipulation operations).
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("text", '');
formData.append("num_sentences", 0);

var url = 'http://localhost:32168/v1/text/summarize';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("summary: " + data.summary)
                   console.log("inferenceMs: " + data.inferenceMs)
                   console.log("processMs: " + data.processMs)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



## Training

### Create Custom Dataset

Create a custom dataset from the Open Images repository.

``` title=''
POST: http://localhost:32168/v1/train/create_dataset
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **name** (String): The name of the model.

 - **classes** (String): A comma delimited list of classes to include in the dataset.

 - **num_images** (Integer): The max number of images to include for each class. Default 100.
   *Optional*. Defaults to 100

**Response**

``` json
{
  "success": (Boolean) // True if creating a dataset started.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("name", null);
formData.append("classes", null);
formData.append("num_images", 100);

var url = 'http://localhost:32168/v1/train/create_dataset';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Train Custom Model (YOLOv5 6.2)

Create a custom model from a custom dataset.

``` title=''
POST: http://localhost:32168/v1/train/train_model
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **name** (String): The name of the model.

 - **dataset** (String): The name of the dataset.

 - **num_epochs** (Integer): The epoch to train the model. Default 100.
   *Optional*. Defaults to 100

 - **device** (String): None or 'cpu' or 0 or '0' or '0,1,2,3'. Default: ''

 - **batch** (Integer): The batch size. Default: 8
   *Optional*. Defaults to 8

 - **freeze** (Integer): The layers to freeze, 0-None, 10-Backbone, 24-All
   *Optional*. Defaults to 0

 - **hyp** (Integer): Hyper-Parameters: 0-finetune (VOC), 1-scratch low, 2-scratch medium, 3-scratch high
   *Optional*. Defaults to 0

**Response**

``` json
{
  "success": (Boolean) // True if training started.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("name", null);
formData.append("dataset", null);
formData.append("num_epochs", 100);
formData.append("device", );
formData.append("batch", 8);
formData.append("freeze", 0);
formData.append("hyp", 0);

var url = 'http://localhost:32168/v1/train/train_model';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Training Status (YOLOv5 6.2)

Gets the training status

``` title=''
POST: http://localhost:32168/v1/train/status
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

(None)

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "model_name": (String) // The name of the last model training or trained.
  "dataset_name": (String) // The name of the dataset used.
  "action": (String) // The current action.
  "state": (String) // The current state in the action processing.
  "message": (String) // Any message, probably error, to display to the user.
  "progress": (float) // The percentage of completion of current state.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript

var url = 'http://localhost:32168/v1/train/status';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("model_name: " + data.model_name)
                   console.log("dataset_name: " + data.dataset_name)
                   console.log("action: " + data.action)
                   console.log("state: " + data.state)
                   console.log("message: " + data.message)
                   console.log("progress: " + data.progress.toFixed(2))
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Cancel Dataset or Model creation

Cancel the creation of Model or Dataset.

``` title=''
POST: http://localhost:32168/v1/train/cancel
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

(None)

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript

var url = 'http://localhost:32168/v1/train/cancel';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Resume Training Model

Resume training of a model.

``` title=''
POST: http://localhost:32168/v1/train/resume_training
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **model_name** (String): The name of the model.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("model_name", null);

var url = 'http://localhost:32168/v1/train/resume_training';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Get Model information (YOLOv5 6.2)

Gets info about the model.

``` title=''
POST: http://localhost:32168/v1/train/model_info
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **model_name** (String): The name of the model.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "model_name": (String) // The name of the model.
  "complete": (Boolean) // True if the training was completed, can restart if not.
  "training_dir": (String) // The training directory containing the custom model file and the training results.
  "model_path": (String) // The path to best the custom model file.
  "results_graph_path": (String) // The path the results.png file if it exists.
  "results_csv_path": (String) // The path the results.csv file if it exists.
  "pr_curve_path": (String) // The path PR_curve.png file if it exists.
  "results_graph_image": (Base64ImageData) // The base64 encoded image of the result graphs.
  "pr_curve_image": (Base64ImageData) // The base64 encoded image of the PR Curve graph.
  "results_csv_file": (Base64ImageData) // The base64 encoded data for the results.csv file.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("model_name", null);

var url = 'http://localhost:32168/v1/train/model_info';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("model_name: " + data.model_name)
                   console.log("complete: " + data.complete)
                   console.log("training_dir: " + data.training_dir)
                   console.log("model_path: " + data.model_path)
                   console.log("results_graph_path: " + data.results_graph_path)
                   console.log("results_csv_path: " + data.results_csv_path)
                   console.log("pr_curve_path: " + data.pr_curve_path)
                   // Assume we have an IMG tag named img1
                   img1.src = "data:image/png;base64," + data.results_graph_image;
                   // Assume we have an IMG tag named img2
                   img2.src = "data:image/png;base64," + data.pr_curve_image;
                   // Assume we have an IMG tag named img3
                   img3.src = "data:image/png;base64," + data.results_csv_file;
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```



### Get Dataset information (YOLOv5 6.2)

Gets info about the dataset.

``` title=''
POST: http://localhost:32168/v1/train/dataset_info
```

**Platforms**

All, !Raspberrypi, !Orangepi, !Jetson

**Parameters**

 - **dataset_name** (String): The name of the dataset.

**Response**

``` json
{
  "success": (Boolean) // True if successful.
  "complete": (Boolean) // True if the training was completed, can restart if not.
  "moduleId": (String) // The Id of the module that processed this request.
  "moduleName": (String) // The name of the module that processed this request.
  "command": (String) // The command that was sent as part of this request. Can be detect, list, status.
  "executionProvider": (String) // The name of the device or package handling the inference. eg CPU, GPU, TPU, DirectML.
  "canUseGPU": (Boolean) // True if this module can use the current GPU if one is present.
  "analysisRoundTripMs": (Integer) // The time (ms) for the round trip to the analysis module and back.
}
```


#### Example

```javascript
var formData = new FormData();
formData.append("dataset_name", null);

var url = 'http://localhost:32168/v1/train/dataset_info';

fetch(url, { method: "POST", body: formData})
      .then(response => {
           if (response.ok) {
               response.json().then(data => {
                   console.log("success: " + data.success)
                   console.log("complete: " + data.complete)
                   console.log("moduleId: " + data.moduleId)
                   console.log("moduleName: " + data.moduleName)
                   console.log("command: " + data.command)
                   console.log("executionProvider: " + data.executionProvider)
                   console.log("canUseGPU: " + data.canUseGPU)
                   console.log("analysisRoundTripMs: " + data.analysisRoundTripMs)
               })
           }
       });
        .catch (error => {
            console.log('Unable to complete API call: ' + error);
       });
```


<br>

## Settings

### Change a setting

``` title=''
`POST: localhost:32168/v1/settings/<ModuleId>`
```
Sets the value of a setting for the given module.

**Platforms**

All

**Parameters**

 - **name** - the name of a setting. Please refer to [Module Settings](module_settings.md) for the modules and global settings that can be changed.
 - **value** - The new value of the setting.

**Response**

```json
{
  "success": (Boolean) // True if successful.
}
```

Note that when this API is called, the server will restart the given module
automatically, and the changes will be persisted across server and module
restarts.

### List settings

``` title=''
`GET: localhost:32168/v1/settings/<ModuleId>`
```
Gets all the settings for the given module.

**Platforms**

All

**Response**

The response will be a Json object with the general 'success' property, as well
as two collections: `environmentVariables` are the environment variables passed
to the module's code, and `settings` which define how the module will be started.

```json
{
    "success": true,

    "environmentVariables": {
        "CPAI_APPROOTPATH": "C:\\Program Files\\CodeProject\\AI",
        "CPAI_PORT": "32168",
        "APPDIR": "%CURRENT_MODULE_PATH%",
        "CPAI_HALF_PRECISION": "enable",
        "CPAI_MODULE_SUPPORT_GPU": "False",
        "CUSTOM_MODELS_DIR": "%CURRENT_MODULE_PATH%\\custom-models",
        "MODELS_DIR": "%CURRENT_MODULE_PATH%\\assets",
        "MODEL_SIZE": "medium",
        "USE_CUDA": "False",
        "YOLOV5_AUTOINSTALL": "false",
        "YOLOV5_VERBOSE": "false"
    },

    "settings": {
        "autostart": true,
        "supportGPU": true,
        "logVerbosity": null,
        "halfPrecision": "enable",
        "parallelism": 0,
        "postStartPauseSecs": 1
    }
}
```


## Status

### Server Logs

``` title=''
GET: /v1/log/list?count=<count>&last_id=<lastid>
```

Gets up to 20 log entries, starting from id = <lastid>. The "<lastid>" value can be omitted. What's
returned is an array of entries

**Platforms**

Windows, Linux, macOS, macOS-Arm, Docker

**Parameters**

 - **lastid** - the ID of the last entry that was retrieved, in order to send only new log entries
 - **count** - The number of entries to return

**Response**

```json
{
    "id": Integer, The id of the log entry
    "timestamp": A datetime value. The timestamp as UTC time of the log entry
    "entry": Text. The text of the entry itself
}
```


### Server Ping

A server ping. Just so you can easily tell if it's alive

``` title=''
GET: /v1/status/ping
```
**Platforms**

Windows, Linux, macOS, macOS-Arm, Docker

**Response**

```json
{ 
    "success": true 
}
```

If all is good.


### Server Version

Returns the current version of the server

``` title=''
GET: /v1/status/version
```
**Platforms**

Windows, Linux, macOS, macOS-Arm, Docker

**Response**

```json
{
    "success": true,
    "version": {
        "major": 2,
        "minor": 2,
        "patch": 4,
        "preRelease": "Beta",
        "securityUpdate": false,
        "build": 0,
        "file": "CodeProject.AI.Server-2.2.4.zip",
        "releaseNotes": "Features and improvements"
    },
    "message": "2.2.4-Beta"
}
```

### Server Update Available

A note on whether an update is available

``` title=''
GET: /v1/status/updateavailable
```
**Platforms**

Windows, Linux, macOS, macOS-Arm, Docker

**Response** 

```json 
{
    "success"         : true/false,
    "message"         : "An update to version X  is available" / "You have the latest",
    "version"         : <version object>, // [Deprecated] The latest available version
    "current"         : <version object>, // The current installed version
    "latest"          : <version object>, // The latest available version
    "updateAvailable" : true/false
};
```

Where version object is

```json 
"versionInfo": {
    "major": 2,
    "minor": 2,
    "patch": 4,
    "preRelease": "Beta",
    "securityUpdate": false,
    "build": 0,
    "file": "CodeProject.AI.Server-2.2.4.zip",
    "releaseNotes": "Features and improvements."
}
```

<!--

Image Enhance
http://localhost:80/v1/vision/enhance
The image enhance API enlarges your image by 4X the original width and height, while simulatenously increasing the quality of the image.

parameters [POST]Response
{
    "success": True,
    "base64": ".........mabKicgSdq/3fSo6UfcH0pATmhEgST3phPHNKe1RuetUJn//2Q==",
    "width": 1840
    "height": 1036
}

-->




