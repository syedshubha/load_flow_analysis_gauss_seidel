function []= starting()

fprintf('\n\t\t Determination of Power Flow Using Gauss-Seidel Method for n Bus System by 1606007,1606009,1606023 & 1606027\n\n'); 

fprintf('In current directory you will get line_data.csv and bus_data.csv. You can edit and save these files to give us input data.\n');
fprintf('Note that Bus_type=0 means slack bus, Bus_type=1 means load bus and Bus_type=2 means PV bus. Also Bus No. 1 must be slack bus. Read readme.txt for details\n\n');
fprintf('If you are done, press any Key to continue ... ');
pause
clc
end