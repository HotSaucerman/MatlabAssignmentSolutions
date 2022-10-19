function [sumi] = Question3(inputNum1,inputNum2)
sumi = inputNum1+inputNum2;
if mod(sumi,2)==1
    disp("Hah")
elseif mod(sumi,2)==0
    disp("woo")
end 
end