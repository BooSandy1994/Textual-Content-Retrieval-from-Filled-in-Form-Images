function [ out_vertical ] = vertical(row,col,bw )
    pad_bw = padarray(bw,[4,4],1,'both');
    out_vertical = 0;
    i = (row+4) - 1;
   while(pad_bw(i,(col+4))==0)
       out_vertical = out_vertical + 1;
       i = i - 1;
   end
   i = (row+4) + 1;
   while(pad_bw(i,(col+4))==0)
       out_vertical = out_vertical + 1;
       i = i + 1;
   end

end

