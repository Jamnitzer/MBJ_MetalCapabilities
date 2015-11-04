# MBJ_MetalCapabilities

A conversion to Swift of the example MBE_MetalCapabilities written by Warren Moore.
[Metal By Example](http://metalbyexample.com).

Converted to Swift by Jamnitzer (Jim Wrenholt)

This sample extends the textured quad sample by adding a Metal compute encoder to convert the image to greyscale. Note the compute encoder is part of the same pass as the render encoder and hence demonstrates how you can use the same shared CPU/GPU data across compute and rendering.

***


![](https://raw.githubusercontent.com/Jamnitzer/MBJ_MetalCapabilities/master/screen.png)
