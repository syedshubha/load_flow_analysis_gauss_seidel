function output2(From,To,Y,y,I,pf,P_l,Q_l,P_ls,Q_ls,I_cond,P_cond,pf_cond)
  
format long
for a=1:length(From)
     i= From(a,1); j= To(a,1);
     Line_admittance(a,1)= Y(i,j);
     Shunt_admittance(a,1)= imag(y(i,j));
     Power_factor(a,1)= pf(i,j);
     Line_current_magnitude(a,1)= abs(I(i,j));  
     Line_current_phase(a,1)= (180/pi).*angle(I(i,j));
     P_line1(a,1)= P_l(i,j);
     P_line2(a,1)= P_l(j,i);
     P_loss(a,1)= P_ls(i,j);
     Q_loss(a,1)= Q_ls(i,j);
     Q_line1(a,1)= Q_l(i,j);
     Q_line2(a,1)= Q_l(j,i);
end

current_report= abnormality(Line_current_magnitude,I_cond);
P_line1_report= abnormality(P_line1,P_cond);
P_line2_report= abnormality(P_line2,P_cond);
Power_factor_report= abnormality(Power_factor,pf_cond);

T= table(From,To,Line_admittance,Shunt_admittance,Line_current_magnitude,Line_current_phase,current_report,P_line1,P_line1_report,P_line2,P_line1_report,Q_line1,Q_line2,P_loss,Q_loss,Power_factor,Power_factor_report);
writetable(T,'Final_line_data.csv' );

end
