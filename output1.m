function []= output1(Bus_type,P_gen,Q_gen,P_load,Q_load,V_magnitude,V_phase,I_magitude,I_phase,V_cond,n)
 
format long
 for i=1:n
   if Bus_type(i,1) == 0
     Remark{i,1}= 'Slack bus';
   elseif Bus_type(i,1) == 2 
       Remark{i,1}= 'PV bus';
   else
       Remark{i,1}= 'Load Bus'; 
   end
   Bus_Number(i,1)=i;
 end

V_phase= (180/pi).*V_phase;  % in degree
I_phase= (180/pi).*I_phase;

V_report= abnormality(V_magnitude,V_cond);

T= table(Bus_Number,Remark,P_gen,Q_gen,P_load,Q_load,V_magnitude,V_phase,V_report,I_magitude,I_phase);

writetable(T,'Final_Bus_data.csv' );

end
