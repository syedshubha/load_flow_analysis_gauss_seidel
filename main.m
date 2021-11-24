clear all; 
close all;
clc;

format long
warning off

starting(); 

disp('how many digit you need to be accurate? :');
tol= input('');

%disp('Set your Base MVA: ');
%base= input(' ');
base= 100;  % default value, make it a comment if necessary

%disp('type your accelaration factor between 1 and 2 (preferable value 1.6) : ');
%a= input('');
a= 1.6; %default value, make it a comment if necessary

clc;
disp('calculating......');

[Bus, P1, Q1, V1, Q_min, Q_max, V_cond,n]= bus_data(base) ;
[Y, y ,I_cond, P_cond, pf_cond]= line_data(n);

[P,Q,V,I,P_loss,Q_loss]= gauss_seidel(n,Y,y,Bus,P1,Q1,V1,tol,a,Q_min,Q_max);

output(base,n,Y,y,Bus,P,Q,V,I,P_loss,Q_loss,V_cond,I_cond,P_cond,pf_cond);

clear P1 V1 Q1 y P_loss Q_loss Q_max Q_min I bus a I_cond V_cond P_cond pf_cond 

%fprintf('\n\n\t\t\t\t Final Bus Data');
%type 'Final_Bus_data.csv';

%fprintf('\n\n\t\t\t\t Final Line Data');
%type 'Final_line_data.csv';

fprintf('\n\n Open Final_Bus_data.csv and Final_line_data.csv created in current directory\n')
