function [p,q,P_loss,Q_loss,I]= slack(n,Y,y,V,P,Q)

format long
I= zeros(n);

for i=1:n
    for k=1:n
        I(i,k)= -Y(i,k)*(V(i)-V(k));
    end
end

for i=1:n
    for k=1:n
     if abs(Y(i,k))
        P_loss(i,k)= real((-(abs(I(i,k)))^2)/Y(i,k));
        Q_loss1(i,k)= imag((-(abs(I(i,k)))^2)/Y(i,k));
     else
         P_loss(i,k)= 0;
         Q_loss(i,k)= 0;
     end
    end
end


for i=1:n
    for k=1:n
        Q_loss2(i,k)= imag((abs(V(i))^2+abs(V(k))^2).*y(i,k));
    end
end

Q_loss= Q_loss1-Q_loss2;

P_loss_tot= sum(sum(abs(P_loss)))/2 ;

p1= sum(sum(P_loss))/2;

 if P_loss_tot ~= p1
    clc     
    error('Wrong data in P_gen or P_load!!!!');
 end
 
Q_loss_tot= sum(sum(Q_loss))/2;

p= P_loss_tot-sum(P(2:n));
q= Q_loss_tot- sum(Q(2:n));
end