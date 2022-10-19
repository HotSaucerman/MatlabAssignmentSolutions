function Question7(inputVec1,inputVec2)
%Use quiver to plot the vectors seperatly, vectors are 2 numbers
quiver(0,0,inputVec1(1),inputVec1(2))
hold on
quiver(0,0,inputVec2(1),inputVec2(2))
xlabel("X Axis")
ylabel("Y Axis")
title("X vs. Y")
end