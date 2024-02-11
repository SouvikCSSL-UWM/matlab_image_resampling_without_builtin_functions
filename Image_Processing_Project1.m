%% Project 1 - Image Resampling
clear; close all; clc
%% A sample image is given - 'MRI-Brain.pgm which is to be resampled
%% Read the Image
figure(1)
im = imread('MRI-brain.pgm');
imshow(im);
truesize
%% Define the variables - size of the image, and scaling factor, size of the new image
[M,N] = size(im); % Size of the image in x axis and y axis
t = 1.3; %Scaling Factor
M_prime = round(M*t); % size of the resampled image in y axis
N_prime = round(N*t); % size of the resampled image in x axis
nim = []; % initial intensity for the resampled image matrix
temp = 1; % temporary row co-ordinate for resampled image
gemp = 1; % temporary column co-ordinate for resampled image
%% Resampling operations - resizing by changing the number of pixels and determining intensity values for each pixel of the target
for i= (1:(1/t):M)
    for j = 1:(1/t):N
        % Nearest Neighbourhood method for the co-ordinates where bi-linear interpolation is not possible
        if or(or(round(j) == 1, round(j) == N),or(round(i)==1,round(j)==N-1))
            nim(temp,gemp) = im(round(i),round(j));
        else
            % Bilinear Interpolation
            top_x = im(round(i),round(j)-1)+((im(round(i),round(j)-1) - im(round(i),round(j)+1))/2)*t; % Linear Interpolation between top neighbours
            bot_x = im(round(i)-1,round(j)-1)+((im(round(i)-1,round(j)-1) - im(round(i)-1,round(j)+1))/2)*t; % Linear Interpolation between bottom neighbours
            % Interpolated intensity I of target pixel
            I = top_x+t*(top_x - bot_x)/2; % Linear Interpolation between top and bottom neighbour
            nim(temp,gemp) = I; % Assigning the intensity values to the pixel
        end
        gemp = gemp+1;
    end
    temp = temp+1;
    gemp = 1;
end

%% Target Image
new_image = uint8(nim); % New Image
figure(2)
imshow(new_image)
truesize


