---
---
title: The CodeProject.AI Server Mesh
tags:
  - CodeProject.AI
  - Mesh
---

# CodeProject.AI Server Modules

Supporting CodeProject.AI Server 2.9.


### Computer Audition

 - **Sound Classifier (TensorFlow)**
   v1.4.0 &nbsp; All Platforms &nbsp; Python, TensorFlow
   The sound classifier uses Tensorflow with Python to classify sound files based on the UrbanSound8K dataset.

   Project by [Chris Maunder](https://codeproject.com/ai), based on [Tensorflow-Audio-Classification](https://github.com/luuil/Tensorflow-Audio-Classification).
<br>


### Computer Vision

 - **License Plate Reader**
   v3.3.0 &nbsp; All Platforms except Windows-arm64 &nbsp; Python, PaddlePaddle
   Detects and readers single-line and multi-line license plates using YOLO object detection and the PaddleOCR toolkit

   By Mike Lud
<br>
 - **License Plate Reader (RKNN)**
   v1.5.0 &nbsp; Orange Pi,  Radxa ROCK &nbsp; Python, FastDeploy
   Detects and readers single-line and multi-line licence plates. This module only works with Rockchip RK3588/RK3588S NPUs like the Orange Pi 5/5B/5 Plus or Radxa ROCK.

   By Mike Lud
<br>
 - **Object Detection (Coral)**
   v2.4.0 &nbsp; All Platforms &nbsp; Python, TensorFlow-Lite
   The object detection module uses the Coral TPU to locate and classify the objects the models have been trained on.

   Project by [Chris Maunder, Seth Price](https://codeproject.com/ai), based on [Coral.ai examples](https://github.com/google-coral/pycoral/blob/master/examples/detect_image.py).
<br>
 - **Object Detection (YOLOv5 .NET)**
   v1.11.0 &nbsp; All Platforms except Windows-arm64 &nbsp; C#, ONNX, DirectML, YOLO
   Provides Object Detection using YOLOv5 ONNX models with DirectML. This module is best for those on Windows and Linux without CUDA enabled GPUs

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [yolov5-net](https://github.com/techwingslab/yolov5-net).
<br>
 - **Object Detection (YOLOv5 3.1)**
   v1.11.0 &nbsp; All Platforms except macOS &nbsp; Python, PyTorch, YOLO
   Provides Object Detection using YOLOv5 3.1 targeting CUDA 10 or 11 for older GPUs.

   Project by [Chris Maunder, Matthew Dennis](https://codeproject.com/ai), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>
 - **Object Detection (YOLOv5 6.2)**
   v1.10.0 &nbsp; All Platforms except Raspberry Pi,  Jetson &nbsp; 
   Provides Object Detection using YOLOv5 6.2 targeting CUDA 11.5+, PyTorch < 2.0 for newer GPUs.

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5).
<br>
 - **Object Detection (YOLOv5 RKNN)**
   v1.8.0 &nbsp; Orange Pi,  Radxa ROCK &nbsp; Python, FastDeploy, YOLO
   Provides Object Detection using YOLOv5 RKNN models. This module only works with Rockchip RK3588/RK3588S NPUs like the Orange Pi 5/5B/5 Plus

   By Mike Lud
<br>
 - **Object Detection (YOLOv8)**
   v1.6.0 &nbsp; All Platforms &nbsp; Python, PyTorch, YOLO
   Provides Object Detection in Python>=3.8 using YOLOv8. Great for newer NVIDIA GPUs

   Project by [Chris Maunder](https://codeproject.com/ai), based on [ultralytics](https://github.com/ultralytics/ultralytics).
<br>
 - **Optical Character Recognition**
   v2.2.0 &nbsp; All Platforms except Windows-arm64 &nbsp; Python, PaddlePaddle
   Provides OCR support using the PaddleOCR toolkit

   By Mike Lud
<br>
 - **Scene Classification**
   v1.8.0 &nbsp; All Platforms except Jetson &nbsp; Python, PyTorch
   Classifies an image according to one of 365 pre-trained scenes

   Project by [Chris Maunder, Matthew Dennis](https://codeproject.com/ai), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>


### Face Recognition

 - **Face Processing**
   v1.12.0 &nbsp; All Platforms except Jetson &nbsp; Python, PyTorch
   A number of Face image APIs including detect, recognize, and compare.

   Project by [Chris Maunder, Matthew Dennis](https://codeproject.com/ai), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>


### Generative AI

 - **LlamaChat**
   v1.7.1 &nbsp; All Platforms except Windows-arm64,  Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, Llama
   A Large Language Model based on the Machine Learning Compilation for LLMs

   Project by [Chris Maunder](https://codeproject.com/ai), based on [llama-cpp-python](https://github.com/abetlen/llama-cpp-python).
<br>
 - **MultiModeLLM**
   v1.0.0 &nbsp; Windows,  Linux,  macOS,  macOS &nbsp; Python, Phi-3
   A multi-modal Large Language Model

   Project by [Chris Maunder](https://codeproject.com/ai), based on [chat-with-phi-3-vision](https://huggingface.co/microsoft/Phi-3-vision-128k-instruct/blob/main/sample_inference.py).
<br>
 - **Text to Image**
   v1.3.0 &nbsp; Windows,  macOS,  Linux &nbsp; Python, PyTorch, Stable Diffusion
   Generates an image from a text prompt.

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [Diffusers](https://github.com/huggingface/diffusers).
<br>


### Image Processing

 - **Background Remover**
   v1.11.0 &nbsp; All Platforms except Linux,  Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, ONNX
   Automatically removes the background from a picture

   Project by [Chris Maunder](https://codeproject.com/ai), based on [rembg](https://github.com/danielgatis/rembg).
<br>
 - **Cartoonizer**
   v1.7.0 &nbsp; All Platforms except Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, PyTorch
   Convert a photo into an anime style cartoon

   Project by [Chris Maunder](https://codeproject.com/ai), based on [animegan2-pytorch](https://github.com/bryandlee/animegan2-pytorch).
<br>
 - **Portrait Filter**
   v2.1.0 &nbsp; Windows &nbsp; C#, ONNX, DirectML
   Provides a depth-of-field (bokeh) effect on images. Great for selfies.

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [C# PortraitModeFilter](https://blog.csdn.net/lw112190/article/details/133831461).
<br>
 - **Super Resolution**
   v2.2.0 &nbsp; All Platforms &nbsp; Python, ONNX
   Increases the resolution of an image using AI

   Project by [Chris Maunder](https://codeproject.com/ai), based on [PyTorch.org example](https://pytorch.org/tutorials/advanced/super_resolution_with_onnxruntime.html?highlight=superresolution).
<br>


### Natural Language

 - **Sentiment Analysis**
   v2.1.0 &nbsp; Windows,  macOS &nbsp; C#, TensorFlow
   Provides an analysis of the sentiment of a piece of text. Positive or negative?

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [.NET ML Samples](https://github.com/dotnet/samples/tree/main/machine-learning/tutorials/TextClassificationTF).
<br>
 - **Text Summary**
   v1.9.0 &nbsp; All Platforms &nbsp; Python, NLTK
   Summarizes text content by selecting a number of sentences that are most representative of the content.

   Project by [Chris Maunder](https://codeproject.com/ai), based on [Github gist](https://gist.github.com/edubey/cc41dbdec508a051675daf8e8bba62c5).
<br>


### Training

 - **Training for YoloV5 6.2**
   v1.7.0 &nbsp; All Platforms except Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, PyTorch, YOLO
   Train custom models for YOLOv5 v6.2 with support for CPUs, CUDA enabled GPUs, and Apple Silicon.

   Project by [Matthew Dennis](https://codeproject.com/ai), based on [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5).
<br>