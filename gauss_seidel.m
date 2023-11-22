function [P,Q,V,I,P_loss,Q_loss]= gauss_seidel(n,Y,y,B,P,Q,V,tol,a,Q_min,Q_max)

format long
tol=tol+1;
iter_max= 100000;

for i= 1:iter_max
    Q1=Q; V1=V;
    for k=2:n
        t=Y(k,:)*V;
        if B(k)==1
            V(k)= ((P(k)-j*Q(k))/(conj(V(k)))- t+V(k)*Y(k,k))/Y(k,k);
            V(k)= (1-a)*V1(k)+a*V(k);     %for accelartion
        elseif B(k)==2
            check=1;
            Q(k)= -imag(conj(V(k))*t);
            
            %
            
            if (abs(Q_min(k))+abs(Q_max(k))) > 0
                if Q(k)< Q_min(k)
                    check=0;
                    Q(k)= Q_min(k);
                elseif Q(k)> Q_max(k)
                    check=0;
                    Q(k)= Q_max(k);
                end
            end
            %
            v= ((P(k)-j*Q(k))/(conj(V(k)))- t+V(k)*Y(k,k))/Y(k,k);
            
            if check
                [v1 v2]=pol2cart(angle(v),abs(V(k)));
                V(k)= v1+j*v2;
            else
                V(k)= v;
            end
        end
    end
    c=1;
    for l=1:n
        
        if abs(abs(V(l))-abs(V1(l)))> 10^(-tol)
            c=0;
        end
        
        if abs(angle(V(l))-angle(V1(l)))> 10^(-tol)
            c=0;
        end
        
        if abs(Q(l)-Q1(l))> 10^(-tol)
            c=0;
        end
        
    end
    if c
        break
    end
end


clc
fprintf('total iterations required for %d digit accuracy = %d\n',tol-1,i);
[P(1) Q(1) P_loss Q_loss I]= slack(n,Y,y,V,P,Q);

end