function []= output(base,n,Y,y,Bus,P,Q,V,I,P_loss,Q_loss,V_cond,I_cond,P_cond,pf_cond)

format long
T= readtable('bus_data.csv');
t= readtable('line_data.csv');


P_load= T{:,5};
Q_load= T{:,6};

for i=1:length(P_load)
    P_gen(i,1)= base.*P(i,1)+P_load(i,1);
    Q_gen(i,1)= base.*Q(i,1)+Q_load(i,1);
    
    if abs(P_gen(i,1))< 10^(-10)       %Just to get a nice output since matlab has a bug in zero
           P_gen(i,1)=0;
    end
    
    if abs(Q_gen(i,1))<10^(-10)
           Q_gen(i,1)=0;
    end
end


S= zeros(n);
for p=1:n
   for q=1:n
       S(p,q)= (V(p))*conj(I(p,q))-y(p,q)*abs(V(p))^2;   %complex power flow of a line
   end
end

P_line= real(S);

Q_line= imag(S);

pf= abs(cos(angle(S)));  %power factor of a line

output1(T{:,2},P_gen,Q_gen,P_load,Q_load,abs(V),angle(V),abs(sum(I')'),angle(sum(I')'),V_cond,n);
output2(t{:,1},t{:,2},Y,y,I,pf,base*P_line,base*Q_line,base*P_loss,base*Q_loss,I_cond,P_cond,pf_cond);

end
   