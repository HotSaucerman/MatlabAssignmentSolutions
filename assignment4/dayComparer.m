function [WAAAAAHOOOOOOOOOOOO] = dayComparer(day1,day2,SubjectID)
%Inputs: Two doubles matrices of the subjects isometric strenth
%measurements and one catagorical matrix which holds the subject IDS
% Outputs: a matrix of the subject IDS in which the day2 value is greater
% than the day1 value
WAAAAAHOOOOOOOOOOOO=[];
for i=1:length(SubjectID)
    if day1(i)<day2(i)
        WAAAAAHOOOOOOOOOOOO=[WAAAAAHOOOOOOOOOOOO;SubjectID(i)];
    end
end 