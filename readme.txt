Author: Souvik Roy

Image 'MRI-brain.pgm' is resampled

Files:
1. Code: Image_Processing_Project1.m
2. Given Image: MRI-brain.pgm
3. Resized Image at t = 0.5: scalling factor 0.5.png
4. Resized Image at t = 1.3: scalling factor 1.3.png

Execution:
The code can be executed by changing the value of scalling factor t.

Mainly, bilinear Interpolation is used to determine the intensity of the pixels of the rescaled images.

Bilinear Interpolation is not possible for some of the corner pixels - 
(i) 1st row
(ii) 1st column
(iii) Last column

For the mentioned pixels nearest neighbourhood approach is chosen to determine the intensity