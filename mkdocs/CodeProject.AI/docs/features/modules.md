---
---
title: The CodeProject.AI Modules
tags:
  - CodeProject.AI
  - Modules
---

# CodeProject.AI Modules

Supporting CodeProject.AI Server 2.9.5.


### Computer Audition

 - **Sound Classifier (TensorFlow)**<br>
   The sound classifier uses Tensorflow with Python to classify sound files based on the UrbanSound8K dataset.<br>
   v1.4.0 &nbsp; All Platforms &nbsp; Python, TensorFlow<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [Tensorflow-Audio-Classification](https://github.com/luuil/Tensorflow-Audio-Classification).
<br>


### Computer Vision

 - **License Plate Reader**<br>
   Detects and readers single-line and multi-line license plates using YOLO object detection and the PaddleOCR toolkit<br>
   v3.3.3 &nbsp; All Platforms except Windows-arm64 &nbsp; Python, PaddlePaddle<br>
   By Mike Lud
<br>
 - **License Plate Reader (RKNN)**<br>
   Detects and readers single-line and multi-line licence plates. This module only works with Rockchip RK3588/RK3588S NPUs like the Orange Pi 5/5B/5 Plus or Radxa ROCK.<br>
   v1.5.0 &nbsp; Orange Pi,  Radxa ROCK &nbsp; Python, FastDeploy<br>
   By Mike Lud
<br>
 - **Object Detection (Coral)**<br>
   The object detection module uses the Coral TPU to locate and classify the objects the models have been trained on.<br>
   v2.4.0 &nbsp; All Platforms &nbsp; Python, TensorFlow-Lite<br>
   Project by [Chris Maunder, Seth Price](https://github.com/codeproject/CodeProject.AI-Server/), based on [Coral.ai examples](https://github.com/google-coral/pycoral/blob/master/examples/detect_image.py).
<br>
 - **Object Detection (YOLOv5 .NET)**<br>
   Provides Object Detection using YOLOv5 ONNX models with DirectML. This module is best for those on Windows and Linux without CUDA enabled GPUs<br>
   v1.14.0 &nbsp; All Platforms except Windows-arm64 &nbsp; C#, ONNX, DirectML, YOLO<br>
   Project by [Matthew Dennis](https://codeproject.github.io/codeproject.ai), based on [yolov5-net](https://github.com/techwingslab/yolov5-net).
<br>
 - **Object Detection (YOLOv5 3.1)**<br>
   Provides Object Detection using YOLOv5 3.1 targeting CUDA 10 or 11 for older GPUs.<br>
   v1.12.2 &nbsp; All Platforms except macOS &nbsp; Python, PyTorch, YOLO<br>
   Project by [Chris Maunder, Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>
 - **Object Detection (YOLOv5 6.2)**<br>
   Provides Object Detection using YOLOv5 6.2 targeting CUDA 11.5+, PyTorch < 2.0 for newer GPUs.<br>
   v1.10.0 &nbsp; All Platforms except Raspberry Pi,  Jetson &nbsp; <br>
   Project by [Matthew Dennis](https://codeproject.github.io/codeproject.ai), based on [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5).
<br>
 - **Object Detection (YOLOv5 RKNN)**<br>
   Provides Object Detection using YOLOv5 RKNN models. This module only works with Rockchip RK3588/RK3588S NPUs like the Orange Pi 5/5B/5 Plus<br>
   v1.8.1 &nbsp; Orange Pi,  Radxa ROCK &nbsp; Python, FastDeploy, YOLO<br>
   By Mike Lud
<br>
 - **Object Detection (YOLOv8)**<br>
   Provides Object Detection in Python>=3.8 using YOLOv8. Great for newer NVIDIA GPUs<br>
   v1.6.2 &nbsp; All Platforms &nbsp; Python, PyTorch, YOLO<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [ultralytics](https://github.com/ultralytics/ultralytics).
<br>
 - **Optical Character Recognition**<br>
   Provides OCR support using the PaddleOCR toolkit<br>
   v2.2.3 &nbsp; All Platforms except Windows-arm64 &nbsp; Python, PaddlePaddle<br>
   By Mike Lud
<br>
 - **Scene Classification**<br>
   Classifies an image according to one of 365 pre-trained scenes<br>
   v1.8.0 &nbsp; All Platforms except Jetson &nbsp; Python, PyTorch<br>
   Project by [Chris Maunder, Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>


### Face Recognition

 - **Face Processing**<br>
   A number of Face image APIs including detect, recognize, and compare.<br>
   v1.12.3 &nbsp; All Platforms except Jetson &nbsp; Python, PyTorch<br>
   Project by [Chris Maunder, Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [Deepstack](https://github.com/johnolafenwa/DeepStack).
<br>


### Generative AI

 - **LlamaChat**<br>
   A Large Language Model based on the Machine Learning Compilation for LLMs<br>
   v1.7.1 &nbsp; All Platforms except Windows-arm64,  Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, Llama<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [llama-cpp-python](https://github.com/abetlen/llama-cpp-python).
<br>
 - **MultiModeLLM**<br>
   A multi-modal Large Language Model<br>
   v1.1.0 &nbsp; Windows,  Linux,  macOS,  macOS &nbsp; Python, Phi-3<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [chat-with-phi-3-vision](https://huggingface.co/microsoft/Phi-3-vision-128k-instruct/blob/main/sample_inference.py).
<br>
 - **Text to Image**<br>
   Generates an image from a text prompt.<br>
   v1.3.1 &nbsp; Windows,  macOS,  Linux &nbsp; Python, PyTorch, Stable Diffusion<br>
   Project by [Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [Diffusers](https://github.com/huggingface/diffusers).
<br>


### Image Processing

 - **Background Remover**<br>
   Automatically removes the background from a picture<br>
   v1.11.0 &nbsp; All Platforms except Linux,  Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, ONNX<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [rembg](https://github.com/danielgatis/rembg).
<br>
 - **Cartoonizer**<br>
   Convert a photo into an anime style cartoon<br>
   v1.7.0 &nbsp; All Platforms except Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, PyTorch<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [animegan2-pytorch](https://github.com/bryandlee/animegan2-pytorch).
<br>
 - **Portrait Filter**<br>
   Provides a depth-of-field (bokeh) effect on images. Great for selfies.<br>
   v2.4.0 &nbsp; Windows &nbsp; C#, ONNX, DirectML<br>
   Project by [Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [C# PortraitModeFilter](https://blog.csdn.net/lw112190/article/details/133831461).
<br>
 - **Super Resolution**<br>
   Increases the resolution of an image using AI<br>
   v2.2.1 &nbsp; All Platforms &nbsp; Python, ONNX<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [PyTorch.org example](https://pytorch.org/tutorials/advanced/super_resolution_with_onnxruntime.html?highlight=superresolution).
<br>


### Natural Language

 - **Sentiment Analysis**<br>
   Provides an analysis of the sentiment of a piece of text. Positive or negative?<br>
   v2.4.0 &nbsp; Windows,  macOS &nbsp; C#, TensorFlow<br>
   Project by [Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [.NET ML Samples](https://github.com/dotnet/samples/tree/main/machine-learning/tutorials/TextClassificationTF).
<br>
 - **Text Summary**<br>
   Summarizes text content by selecting a number of sentences that are most representative of the content.<br>
   v1.9.0 &nbsp; All Platforms &nbsp; Python, NLTK<br>
   Project by [Chris Maunder](https://github.com/codeproject/CodeProject.AI-Server/), based on [Github gist](https://gist.github.com/edubey/cc41dbdec508a051675daf8e8bba62c5).
<br>


### Training

 - **Training for YoloV5 6.2**<br>
   Train custom models for YOLOv5 v6.2 with support for CPUs, CUDA enabled GPUs, and Apple Silicon.<br>
   v1.7.0 &nbsp; All Platforms except Raspberry Pi,  Orange Pi,  Radxa ROCK,  Jetson &nbsp; Python, PyTorch, YOLO<br>
   Project by [Matthew Dennis](https://github.com/codeproject/CodeProject.AI-Server/), based on [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5).
<br>
