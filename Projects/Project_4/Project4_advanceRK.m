function [y] = advanceRK( y, dt, method)
%This function calculates the y values for inputted dt and method values.
%Method can be 1,2 ,or 4 and dt is 1, 0.1, 0.01 respectively. This function
%calculates c1,c2, and c3 values and uses them to create different y values
%which later can be used to plot the data. The data approximates the exact
%function with varying sensitivity
switch method
    case 1
        c1 = dt*(-log(2)/2.45)*y;
        y1 = y + c1;
        y=y1;
    case 2
        c1 = dt*(-log(2)/2.45)*y;
        c2 = dt*(-log(2)/2.45)*(y+0.5*c1);
        y1 = y + c2;
        y=y1;
    case 4
        c1 = dt*(-log(2)/2.45)*y;
        c2 = dt*(-log(2)/2.45)*(y+0.5*c1);
        c3 = dt*(-log(2)/2.45)*(y+0.5*c2);
        c4 = dt*(-log(2)/2.45)*(y+c3);
        y1 = y + c1/6 + c2/3 + c3/3 + c4/6;
        y=y1;
    otherwise
        fprintf('Error.');
end
end