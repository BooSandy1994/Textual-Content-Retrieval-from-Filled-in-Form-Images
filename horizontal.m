%stroke width of the horizontal
function [ out_horizontal ] = horizontal(row,col,bw)
   pad_bw = padarray(bw,[4,4],1,'both');
   j = (col+4) + 1; out_horizontal = 0;
   while(pad_bw((row+4),j)==0)
       out_horizontal = out_horizontal + 1;
       j = j + 1;
   end
   j = (col+4) - 1;
   while(pad_bw((row+4),j)==0)
       out_horizontal = out_horizontal + 1;
       j = j - 1;
   end
end

