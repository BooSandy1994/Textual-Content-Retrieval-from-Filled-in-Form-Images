clear;
clc;
% savingFile = 'C:\Users\INTEL\Desktop\testcsv1.csv';
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
           B = zeros(y_w,x_w);
           non_numeral=0; flag = 0;
           blue = 0 ;
           red = 0; 
           for row=1:y_w
               for col=1:x_w
                   if im_label(y+row-1,x+col-1)== i
%                        B(row,col) = 255;
                      if(img_gt(y+row-1,x+col-1,1)==237 && img_gt(y+row-1,x+col-1,2)==28 && img_gt(y+row-1,x+col-1,3)==36)
                          red = red + 1;
                           B(row,col) = 255; flag = 1;
                      elseif(img_gt(y+row-1,x+col-1,1)==63 && img_gt(y+row-1,x+col-1,2)==72 && img_gt(y+row-1,x+col-1,3)==204)
                          blue = blue + 1; 
                           B(row,col) = 255; flag = 1;
                      else
                          non_numeral = non_numeral + 1;
                      end
                   end
               end
           end
           if flag==1
               out_numeral = fullfile('C:\Users\INTEL\Desktop\project\text',[num2str(j) '_' num2str(i) '.bmp']);
               imwrite(~B,out_numeral,'bmp');
               clear B;
           end
        end
    end
end
