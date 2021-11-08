data = csvread('C:\Users\INTEL\Desktop\result.csv');
count_print = 1; 
count_hw = 1;
for row = 1:5956
    if data(row,19) == 2
        %printed case
        source_p_file = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_bw',[num2str(data(row,21)) '_' num2str(data(row,22)) '_bw' '.bmp']);
        dest_p_file = fullfile('C:\Users\INTEL\Desktop\project\result\printed',[num2str(count_print) '.bmp']);
        count_print = count_print + 1;
        copyfile(source_p_file, dest_p_file);
    elseif data(row,20) == 1
        %HW
        source_h_file = fullfile('C:\Users\INTEL\Desktop\project\CC_data\CC_bw',[num2str(data(row,21)) '_' num2str(data(row,22)) '_bw' '.bmp']);
        dest_h_file = fullfile('C:\Users\INTEL\Desktop\project\result\hw',[num2str(count_hw) '.bmp']);
        count_hw = count_hw + 1;
        copyfile(source_h_file,dest_h_file);
    end
end