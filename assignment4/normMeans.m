function [normDay1mean,normDay2mean, normDay3mean] = normMeans(Day1, Day2, Day3, Weight)
%UNTITLED Inputs the day vectors and weight, divides the days isometric
%strength for the individual.  This makes a 25x25 matrix of zeros with one
%line of values. Takes the zeros out and gets the mean of the days weighted
%isometrics as an output.
Day1normw0=Day1/Weight;
Day1norm=nonzeros(Day1normw0);
normDay1mean=mean(Day1norm);
Day2normw0=Day2/Weight;
Day2norm=nonzeros(Day2normw0);
normDay2mean=mean(Day2norm);
Day3normw0=Day3/Weight;
Day3norm=nonzeros(Day3normw0);
normDay3mean=mean(Day3norm);
end