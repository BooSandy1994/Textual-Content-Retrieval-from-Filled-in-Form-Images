% This program is for the separation of H&P separation
% we compare the Otsu threshold, Entropy and the sd of the intensity pixels
% here in this program we generate the csv for analysis
clear;
clc;
savingFile = 'C:\Users\INTEL\Desktop\testcsv1.csv';
for j=1:100
    % we take the rgb images
    j
    if j<10 
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp0000' num2str(j) '.bmp']);
    elseif j>=10 && j<100  
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp000' num2str(j) '.bmp']); 
    else
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp00' num2str(j) '.bmp']);  
    end
    img = imread(in_file);
    if j<10 
       in_gt_file = fullfile('C:\Users\INTEL\Desktop\project\GT',['gt_hwp0000' num2str(j) '.png']);
    elseif j>=10 && j<100
       in_gt_file = fullfile('C:\Users\INTEL\Desktop\project\GT',['gt_hwp000' num2str(j) '.png']); 
    else
       in_gt_file = fullfile('C:\Users\INTEL\Desktop\project\GT',['gt_hwp00' num2str(j) '.png']);  
    end
    img_gt = imread(in_gt_file);%this is the ground truth
    [r,c] = size(img);
    gry = rgb2gray(img);
    th = graythresh(gry);
    bw = im2bw(gry,th);
    stats = regionprops(~bw,'BoundingBox','Area');
    [no_of_comp,c]=size(stats);
    im_label = bwlabel(~bw);
    for i=1:no_of_comp
        if stats(i).Area > 6 
           x = stats(i).BoundingBox(1); x = floor(x)+1; % x is kept as double in stats
           y = stats(i).BoundingBox(2); y = floor(y)+1; % y is kept as double in stats 
           x_w = stats(i).BoundingBox(3);  
           y_w = stats(i).BoundingBox(4);
           A = ones([y_w,x_w])*255; 
%            blue = 0; 
%            red = 0;
%            green = 0;
           hw = 0; 
           printed = 0;
           non_text = 0;
%            non_numeral=0;
%            ash = 0 ;
%            yellow = 0; 
           for row=1:y_w
               for col=1:x_w
                   if im_label(y+row-1,x+col-1)== i
                      if(img_gt(y+row-1,x+col-1,1)==237 && img_gt(y+row-1,x+col-1,2)==28 && img_gt(y+row-1,x+col-1,3)==36 || img_gt(y+row-1,x+col-1,1)==255 && img_gt(y+row-1,x+col-1,2)==242 && img_gt(y+row-1,x+col-1,3)==0 )
                          printed = printed + 1;
                      elseif(img_gt(y+row-1,x+col-1,1)==63 && img_gt(y+row-1,x+col-1,2)==72 && img_gt(y+row-1,x+col-1,3)==204 || img_gt(y+row-1,x+col-1,1)==195 && img_gt(y+row-1,x+col-1,2)==195 && img_gt(y+row-1,x+col-1,3)==195)
                          hw = hw + 1;
                      else
                          non_text = non_text + 1;
                      end
                   end
               end
           end
           if(printed>hw && printed>non_text)
                  %printed numeral
                  input_gray = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_gray',[num2str(j) '_' num2str(i) '_gray' '.bmp']);
                  input_bw   = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_bw',[num2str(j) '_' num2str(i) '_bw' '.bmp']);
                  test_gray_cc = imread(input_gray);
                  test_bw_cc = imread(input_bw);
                  attrib_1 = otsu_sd_pI(test_gray_cc);
                  attrib_2 = test(test_bw_cc);
                  attrib_3 = test_stroke(test_bw_cc);
                  output = horzcat(attrib_1,attrib_2,attrib_3); 
                  output(1,18) = 1;
                  output(1,19) = j;
                  output(1,20) = i;
                  dlmwrite(savingFile,output,'-append');
           elseif(hw>printed && hw>non_text)
                  %HW numeral
                  input_gray = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_gray',[num2str(j) '_' num2str(i) '_gray' '.bmp']);
                  input_bw   = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_bw',[num2str(j) '_' num2str(i) '_bw' '.bmp']);
                  test_bw_cc = imread(input_bw);
                  test_gray_cc = imread(input_gray);
                  attrib_1 = otsu_sd_pI(test_gray_cc); 
                  attrib_2 = test(test_bw_cc);
                  attrib_3 = test_stroke(test_bw_cc);
                  output = horzcat(attrib_1,attrib_2,attrib_3);
                  output(1,18)= 2;
                  output(1,19) = j;
                  output(1,20) = i;
                  dlmwrite(savingFile,output,'-append');
           end
        end
    end
end
