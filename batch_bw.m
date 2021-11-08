% this program is to binarize a batch of data set
for i = 1:100 %change this 100
    if i < 10
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp0000' num2str(i) '.bmp']);
    elseif i>=10 && i<100
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp000' num2str(i) '.bmp']); 
    else
       in_file = fullfile('C:\Users\INTEL\Desktop\project\DATA',['hwp00' num2str(i) '.bmp']);  
    end
    img = imread(in_file);
    gry = rgb2gray(img);
    th  = graythresh(gry);
    bw  = im2bw(gry,th); 
    if i < 10
       out_file = fullfile('C:\Users\INTEL\Desktop\project\bw_data',['hwp0000' num2str(i) '_bw.bmp']);
    elseif i>=10 && i<100
       out_file = fullfile('C:\Users\INTEL\Desktop\project\bw_data',['hwp000' num2str(i) '_bw.bmp']);
    else
       out_file = fullfile('C:\Users\INTEL\Desktop\project\bw_data',['hwp00' num2str(i) '_bw.bmp']);
    end
    imwrite(bw,out_file,'bmp');
end