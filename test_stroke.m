function [out_attrib] = test_stroke(bw)
%clc; clear;
% This is the function to get the stroke width of a CC.
% call test_stroke.m function
% bw is the binary image of cc to be passed into the function.
% bw is LOGICAL 
% stroke width has been calculated in four directions of a pixel.
% comment the attributes you don't need.
%bw = imread('C:\Users\INTEL\Desktop\project\project\output\out310.bmp');
[r,c] = size(bw); counter = 1;
for row=1:r
    for col=1:c
        if bw(row,col)==0
           vertical_direction(counter,1)   = vertical(row,col,bw);
           horizontal_direction(counter,1) = horizontal(row,col,bw);
           upper_diagonal(counter,1) = u_diagonal(row,col,bw);
           lower_diagonal(counter,1) = l_diagonal(row,col,bw);
           mean_direction(counter,1) = width(row,col,bw);
           counter = counter + 1;
        end
    end 
end
out_attrib(1,1) = mean(mean_direction);
out_attrib(1,2) = mean(horizontal_direction);
out_attrib(1,3) = mean(vertical_direction);
out_attrib(1,4) = mean(upper_diagonal);
out_attrib(1,5) = mean(lower_diagonal);
% now the standard deviations
out_attrib(1,6) = std(mean_direction);
out_attrib(1,7) = std(horizontal_direction);
out_attrib(1,8) = std(vertical_direction);
out_attrib(1,9) = std(upper_diagonal);
out_attrib(1,10)= std(lower_diagonal);
end
