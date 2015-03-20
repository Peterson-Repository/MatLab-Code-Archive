%Author: Marco Peterson
%Class: Digital Image Prossecing
%Date: 2-17-2015

%Homework 4

%You need to create a MATLAB function named filterConvolution, which should
%a. Take any gray-level image as the first input argument (imG)
%b. Take any filter (e.g., 3-by-3, 5-by-5, 7-by-7, …, etc.) as the second
   %input argument (f)
%c. Take a padding value as the third input argument (padVal)
%d. Convolute the filter (f) on the given gray-level image (imG) padded
   %with padding value (padVal).
%e. Return filtered image.

%In addition, you need to create a MATLAB script named Hw04.m to test your
%filterConvolution function. In the script, you should
%a. Read a gray-level image (ImG)
%b. Create a for loop with a loop variable x to represent padding option
%where the value of x is increasing from 1 to 3. Padding with 0, 255, and 
%average image intensity when x is 1, 2, and 3 respectively.
%c. Create a for loop with a loop variable y to represent filter size where
%the value of y is increasing from 1 to 3. In the first, second, and third
%iteration, the filter size m is 3, 5, and 7 respectively.
%d. Create an average filter (avgF) of size m-by-m where m can be
%calculated from y.
%e. Call filterConvolution function to apply the average filter (avgF) on
%the gray-level image (ImG) with padding value (or padding option x).
%f. Plot the raw image and the 3 filtered images (i.e., y = 1, 2, and 3)
%in Figure x using subplot.



ImG = imread('cameraman.tif');
%ImG = rgb2gray(ImC);

Filter3 = ones(3);
Filter3 = Filter3 / 9;

Filter5 = ones(5);
Filter5 = Filter5 / 25;

Filter7 = ones(7);
Filter7 = Filter7 / 49;

%Padding with 3 Pixals
figure(1);
subplot(2,2,1);
imshow(ImG);
title('Original Image');

subplot(2,2,2);
ImE_F3_Pad0 = FilterConvolution(ImG, Filter3, 0); %3 Parameters that will give you zeropadding
imshow(ImE_F3_Pad0);
title('Filter size = 3, Padding value 0');

subplot(2,2,3);
ImE_F3_Pad255 = FilterConvolution(ImG, Filter3, 255);
imshow(ImE_F3_Pad255);
title('Filter size = 3, Padding value 255');

subplot(2,2,4);
ImE_F3_PadAvg = FilterConvolution(ImG, Filter3, mean2(ImG));
imshow(ImE_F3_PadAvg);
title('Filter size = 3, Padding value Avg');


%Padding with 5 Pixals
figure(2);
subplot(2,2,1);
imshow(ImG);
title('Original Image');

subplot(2,2,2);
ImE_F5_Pad0 = FilterConvolution(ImG, Filter5, 0); %3 Parameters that will give you zeropadding
imshow(ImE_F5_Pad0);
title('Filter size = 5, Padding value 0');

subplot(2,2,3);
ImE_F5_Pad255 = FilterConvolution(ImG, Filter5, 255);
imshow(ImE_F5_Pad255);
title('Filter size = 5, Padding value 255');

subplot(2,2,4);
ImE_F5_PadAvg = FilterConvolution(ImG, Filter5, mean2(ImG));
imshow(ImE_F5_PadAvg);
title('Filter size = 5, Padding value Avg');



%Padding with 7 Pixals
figure(3);
subplot(2,2,1);
imshow(ImG);
title('Original Image');

subplot(2,2,2);
ImE_F7_Pad0 = FilterConvolution(ImG, Filter7, 0); %3 Parameters that will give you zeropadding
imshow(ImE_F7_Pad0);
title('Filter size = 7, Padding value 0');

subplot(2,2,3);
ImE_F7_Pad255 = FilterConvolution(ImG, Filter7, 255);
imshow(ImE_F7_Pad255);
title('Filter size = 7, Padding value 255');

subplot(2,2,4);
ImE_F7_PadAvg = FilterConvolution(ImG, Filter7, mean2(ImG));
imshow(ImE_F7_PadAvg);
title('Filter size = 7, Padding value Avg');

