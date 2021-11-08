function [out_attrib] = test(bw)
%this function is the test idea that I implemented after discussing with
%shoumik da
%bw = imread('E:\project\output\out11.bmp');
%here bw is the binary image of the connected component
%this function measures the standard deviation of minimum distances on all sides
%this function returns 4 attributes
bw_x = bwmorph(imcomplement(bw), 'remove');
[r,c] = size(bw_x);
for i=1:c
    up(1,i) = -1;
    down(1,i) = -1;
end
for i=1:r
    left(i,1) = -1;
    right(i,1) = -1;
end
comp_bw_x = imcomplement(bw_x);
%-------------------------------------------------------------------------%
for i=1:r
    for j=1:c
        if comp_bw_x(i,j)==0
           d_r_min = abs(i-1); %1 is the r_min
           d_r_max = abs(i-r);
           d_c_min = abs(j-1); % 1 is the c_min
           d_c_max = abs(j-c);
           d = [d_r_min d_r_max d_c_min d_c_max];
           min_d = min(d);
           if min_d == d_r_min
              if d_r_min < up(1,j) || up(1,j) == -1 
                 up(1,j) = d_r_min/r;
              end 
           end
           if min_d == d_r_max 
              if d_r_max < down(1,j) || down(1,j) == -1
                 down(1,j) = d_r_max/r;
              end
           end
           if min_d == d_c_min
              if d_c_min < left(i,1) || left(i,1) == -1
                 left(i,1) = d_c_min/c;
              end 
           end
           if min_d == d_c_max
              if d_c_max < right(i,1) || right(i,1) ==  -1
                 right(i,1) = d_c_max/c;
              end
           end 
        end 
    end 
end 
up = transpose(up);
down = transpose(down);
for i=1:c
    up(i,1) = up(i,1) + 1;
    down(i,1) = down(i,1) + 1;
end 
for i=1:r
    right(i,1) = right(i,1) + 1;
    left(i,1) = left(i,1) + 1;
end
out_attrib(1,1) = std(up);
out_attrib(1,2) = std(down);
out_attrib(1,3) = std(left);
out_attrib(1,4) = std(right);
%-------------------------------------------------------------------------%
    
