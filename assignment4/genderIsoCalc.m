function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
%Creates emtpy matrices for male and female isometric 
maleIsoIndMeans=[];
femaleIsoIndMeans=[];
for i=1:length(Gender)
    if Gender(i)=='F'
        femaleIsoIndMeans=[femaleIsoIndMeans;((Day1(i)+Day2(i)+Day3(i))/3)];
        %For Row (i) when the gender is F the for loop will add the
        %day 1 2 and 3 from that row and divides by 3 for the mean 
        %Split matrix into another matrix
    elseif Gender(i)=='M'
        %Does the same thing as above but for when the Gender is M
        maleIsoIndMeans=[maleIsoIndMeans;((Day1(i)+Day2(i)+Day3(i))/3)];
    end
end
%Takes the mean of all M means
maleGroupIsoMean=mean(maleIsoIndMeans);
%Takes the mean of all F means 
femaleGroupIsoMean=mean(femaleIsoIndMeans);
end