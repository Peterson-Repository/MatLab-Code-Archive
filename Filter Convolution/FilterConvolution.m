%Author: Marco Peterson
%Class: Digital Image Prossecing
%Date: 2-17-2015

%Homework 4

function [ImE] = FilterConvolution(ImG,F,pval)  %Input is ImG and Filter

ImE = zeros(size(ImG),'uint8'); %Creates the matrix with all zeros

%Padding method   
[rows, cols] = size(ImG);
    
%((User defined Fileter Size) -1/2) = 
%The amount of padding to be applied to each side of the image

EdgePadding = (size(F,1)-1)/2; %Ex:5x5 filter subtracts by 1 and
                               %divides by 2: equals 2

%Rows and Colms padds both sides of the image
%Expanding out the matrix to fit your new padding values 
zeroPadding = pval .* ones(rows+(EdgePadding*2),cols+(EdgePadding*2));

% Center the image
                      % Rows                        %Columns
% Range    ( Start Point : End Point      , Start Point : End Point      )   
zeroPadding(EdgePadding+1:EdgePadding+rows,EdgePadding+1:EdgePadding+cols) = ImG;


%Code to find the center (target) of the filter window

for rowsIndex = EdgePadding+1:rows+EdgePadding
    for colsIndex = EdgePadding+1:cols+EdgePadding %Padding the image using extraction
        T = zeroPadding(rowsIndex-EdgePadding:rowsIndex+EdgePadding,colsIndex-EdgePadding:colsIndex+EdgePadding); %create a new variable, T is the 5x5 array
        T = double(F) .* double(T);  %target equals middle of the filter
        ImE(rowsIndex-EdgePadding, colsIndex-EdgePadding) = uint8(sum(T(:)));
        
    end 
end
% Return Cropped convoluted Image with out it's padding values
ImE = uint8(ImE(EdgePadding+1:rows-EdgePadding,EdgePadding+1:cols-EdgePadding));
end 


