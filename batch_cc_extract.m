% this program is for batch extraction of CC for Gray scale image 
for j = 1:100
    if j<10
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp0000' num2str(j) '.bmp']);
    elseif j>=10 && j<100
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp000' num2str(j) '.bmp']); 
    else
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp00' num2str(j) '.bmp']);  
    end
    img = imread(in_file);
    [r,c] = size(img);
    gry = rgb2gray(img);
    th = graythresh(gry);
    bw = im2bw(gry,th);
    stats = regionprops(~bw,'BoundingBox','Area');
    [no_of_comp,c]=size(stats);
    im_label = bwlabel(~bw);
    counter = 1;
    for i=1:no_of_comp
        if stats(i).Area > 6 
           x = stats(i).BoundingBox(1); x = floor(x)+1; % x is kept as double in stats
           y = stats(i).BoundingBox(2); y = floor(y)+1; % y is kept as double in stats 
           x_w = stats(i).BoundingBox(3);  
           y_w = stats(i).BoundingBox(4);
           A = ones([y_w,x_w])*255; 
           B = zeros([y_w,x_w]);
           for row=1:y_w
               for col=1:x_w
                   if im_label(y+row-1,x+col-1)== i
                      A(row,col) = gry(y+row-1,x+col-1);
                      B(row,col) = 255;
                   end
               end 
           end
           out_bw_cc = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_bw',[num2str(j) '_' num2str(i) '_bw' '.bmp']);
           out_gray_cc = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_gray',[num2str(j) '_' num2str(i) '_gray' '.bmp']); 
           A = uint8(A);
           imwrite(A,out_gray_cc,'bmp');
           imwrite(~B,out_bw_cc,'bmp');
           clear A;
           clear B;
           counter = counter + 1;
        end 
    end
end