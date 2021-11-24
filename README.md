# load_flow_analysis_gauss_seidel
We have implemented Gauss Seidel Algorithm to analyze load flow of 'n' bus

Before running main.m you need to give input data as two csv files named bus_data.csv and line_data.csv

**** bus_data.csv : Here Bus no., type of bus, initial voltages (magnitude and phase) in pu, generation and load MW and MVAR and Q_max, Q_min should be given. 
** If a data is missing, put a 0 instead. Don't leave a cell empty. 
Bus no. sould be in serial, like 1,2,3,.. and so on. Type of Bus is very important. 
** The 1 no. Bus is slack bus and Bus_type=0. Any PV bus has bus_type=2 and load bus has bus_type=1. It is a must. You may leave 'Remark' column as empty.


**** line_data.csv: Here from is starting bus, To is ending bus and R+jX is that line impedence. Shunt admittance y/2 is to given. All are in pu. 
** Note that no further permutation is required (such as if you give from=2,to=3 then no need to record from=3,to=2 again)



Now run main.m and give your preferences there (such as base power, tolerance, accelaration factor)

After that you will get two output created/ rewrited in this directory named 'Final_Bus_data.csv' and 'Final_line_data.csv'



**** There are some sample folders such as 'input files 1', 'input files 2'. Each folder contains different sets of input files each named bus_data.csv and line_data.csv 
**  You can copy them and paste in current directory (where main.m is located) by replacing the old ones.
