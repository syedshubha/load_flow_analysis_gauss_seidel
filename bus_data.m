function [Bus, P, Q, V, Q_min, Q_max V_cond,n]= bus_data(base)
format long

T= readtable('bus_data.csv');

n=max(T{:,1});   %number of bus

Bus= T{:,2};  %for bus type indicator
[v1 v2]= pol2cart(T{:,8},T{:,7});   %calculating initial V from magnitude and angle 
V= v1+j*v2;

P= (T{:,3}-T{:,5})./base;
Q= (T{:,4}-T{:,6})./base;

% calculating Q_i min and max
N= length(T{:,9});
if T{1:N,9:10}== zeros(N,2)
    Q_min=T{:,9};
    Q_max= T{:,10};
else
    Q_min= (T{:,9}-T{:,6})./base;
    Q_max= (T{:,10}-T{:,6})./base;
end

V_cond= T{:,11:12};   %for abnormal condition

end
