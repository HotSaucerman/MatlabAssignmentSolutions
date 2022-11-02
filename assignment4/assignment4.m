%Built in function to import the data file and break it into individual
%collumn vectors 
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv')
%Creates emtpy matrices for male and female isometric 
 %For Row (i) when the gender is F the for loop will add the day 1 2 and 3 from that row and divides by 3 for the mean split matrix into another matrix
 % Does the same thing when the gender is M but into a different matrix.Then makes 2 more 1:1 matrices of the male and female group means
[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
%Inputs: Two doubles matrices of the subjects isometric strenth
%measurements and one catagorical matrix which holds the subject IDS
% Outputs: a matrix of the subject IDS in which the day2 value is greater
% than the day1 value
day1toDay2=dayComparer(Day1,Day2,SubjectID)
day2toDay3=dayComparer(Day2,Day3,SubjectID)
%UNTITLED Inputs the day vectors and weight, divides the days isometric
%strength for the individual.  This makes a 25x25 matrix of zeros with one
%line of values. Takes the zeros out and gets the mean of the days weighted
%isometrics as an output.
[normDay1mean,normDay2mean, normDay3mean] = normMeans(Day1, Day2, Day3, Weight)
%Create a 13x9 matrix of zeros to save add the output matrices to 
BigBoard=zeros(13,9);
%Inputs are the matrix outputs of the previous functions.  There is a for
%loop for each matrix which transposes it onto its own collumn of BigBoard
%Outputs the uptdated BigBoard with all answers on it. Also creates a cell
%matrix of column headers then combines the two matrices in a cell matrix
%with headers called BigBoardUpgraded.
[BigBoardUpgraded] = matrixMaker(maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean)
%Saved BigBoard to a csv file
writecell(BigBoardUpgraded,'iso_results.csv')