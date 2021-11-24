function [res]= abnormality(final_data,given_range)

n=length(final_data);

for i=1:n
    res{i,1}='normal';
    if abs(given_range(i,1))+abs(given_range(i,2))>0
        if final_data(i,1)<given_range(i,1)
            res{i,1}='underload';
        elseif final_data(i,1)>given_range(i,2)
            res{i,1}='overload';
        end
    end
end

end