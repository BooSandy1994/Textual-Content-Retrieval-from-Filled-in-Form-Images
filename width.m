
function [ out_width ] = width(row,col,bw)
   % we check the lower diagonal stroke 
   pad_bw = padarray(bw,[4,4],1,'both');
   i = (row+4) + 1; j = (col+4) + 1; w_mat = zeros([1,4]);
   while(pad_bw(i,j)==0)
       w_mat(1,1) = w_mat(1,1) + 1;
       i = i + 1; j = j + 1;
   end
   % we check the upper diagonal stroke
   i = (row+4) - 1; j = (col+4) + 1;
   while(pad_bw(i,j)==0)
       w_mat(1,2) = w_mat(1,2) + 1;
       i = i - 1; j = j + 1;
   end
   %now we check the horizontal stroke
   j = (col+4) + 1;
   while(pad_bw((row+4),j)==0)
       w_mat(1,3) = w_mat(1,3) + 1;
       j = j + 1;
   end
   %now we check the vertical stroke
   i = (row+4) - 1;
   while(pad_bw(i,(col+4))==0)
       w_mat(1,4) = w_mat(1,4) + 1;
       i = i - 1;
   end
   out_width = mean(w_mat);
end
   

