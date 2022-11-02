function [BigBoardUpgraded] = matrixMaker(maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(maleIsoIndMeans)
    insert=maleIsoIndMeans(i);
    BigBoard(i,1)=insert;
end
for i=1:length(femaleIsoIndMeans)
    insert=femaleIsoIndMeans(i);
    BigBoard(i,2)=insert;
end
for i=1:length(maleGroupIsoMean)
    insert=maleGroupIsoMean(i);
    BigBoard(i,3)=insert;
end
for i=1:length(femaleGroupIsoMean)
    insert=femaleGroupIsoMean(i);
    BigBoard(i,4)=insert;
end
for i=1:length(day1toDay2)
    insert=day1toDay2(i);
    BigBoard(i,5)=insert;
end
for i=1:length(day2toDay3)
    insert=day2toDay3(i);
    BigBoard(i,6)=insert;
end
for i=1:length(normDay1mean)
    insert=normDay1mean(i);
    BigBoard(i,7)=insert;
end
for i=1:length(normDay2mean)
    insert=normDay2mean(i);
    BigBoard(i,8)=insert;
end
for i=1:length(normDay3mean)
    insert=normDay3mean(i);
    BigBoard(i,9)=insert;
end
BigBoardHeader={'Individual Male Iso Means','Individual Female Iso Means','Male Iso Mean','Female Iso Means','Increased from Day 1 to Day2','Increased from Day 2 to Day 3','Weight Normalized Day 1 Mean','Weight Normalized Day 2 Mean','Weight Normalized Day 3 Mean'}
BigBoardUpgraded=[BigBoardHeader;num2cell(BigBoard)]
end