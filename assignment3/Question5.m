function[Triangle] = Question5(triangleSides)
Sorter=sort(triangleSides);
if  Sorter(1,3)<Sorter(1,1)+Sorter(1,2)
    Triangle=true
else 
    Triangle=false
end 
end 