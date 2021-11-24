function [Y,y,I_cond,P_cond,pf_cond]= line_data(n)

format long

T= readtable('line_data.csv');

%To check whether user has missed any bus data
ch=[T{:,1};T{:,2}];
for w=1:n    
    check=1;
    for h=1:length(ch);
        if ch(h)== w
              check=0;
        end
    end
    if check
        error('You have missed a bus data!!!! Check line_data.csv again!!!!!');
    end
end


Y= zeros(n);

for a=1:length(T{:,1})
    Y(T{a,1},T{a,2})= -1/(T{a,3}+j*T{a,4});  %just -1/(R+jX)
    Y(T{a,2},T{a,1})= Y(T{a,1},T{a,2});
end

y= zeros(n);  %y=shunt admittance
for a=1:length(T{:,1})
    y(T{a,1},T{a,2})= j*T{a,5};
    y(T{a,2},T{a,1})= y(T{a,1},T{a,2});
end

for a=1:n
    Y(a,a)= sum(y(a,:)-Y(a,:));  %final Y
end

I_cond= T{:,6:7};
P_cond= T{:,8:9};
pf_cond= T{:,10:11};

end