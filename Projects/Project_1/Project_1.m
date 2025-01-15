%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Homework 01
%        Surface Area of an oblate spheroid and Perimeter of an Ellipse
%                  Course: CEE/MAE M20
%                   
%
%                 Author :Onur Calisir
%                  UID: 605-489-394
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear cache
close all
clc

question = input('Please enter the number of the question you would like to see the code for\n');
switch(question)
    case 1 
        disp('Welcome to this algorithm, please enter the corresponding values below to get your result: ')
% for this script we are using variables "x" and "y" which correspond to
% equatorial radius r1 and polar radius r2, respectively.
        x = input('Value for equatorial radius: ');
y = input('Value for polar radius: ');
if (x<0|| y<0)
    error('Error, please enter viable values')
elseif (x>0 || y>0)
 if (y>=x)
    error('Invalid Input, polar radius can not be greater than the equatorial radius, please enter new radius')
elseif(y<x)
    gamma = acos(y/x);
Area = 2*pi*((x^2)+((y^2)/sin(gamma))*log(cos(gamma)/(1-sin(gamma))));
Approximation = 4*pi*((x+y)/2)^2;
fprintf ('The Surface area is = %9.1f\n', Area)
fprintf ('The Approximation is = %9.1f\n', Approximation)
fprintf ('The difference between the real value and the estimated value is =%9.1f\n', Area - Approximation)
end
end
    case 2
          disp('Welcome to this algorithm, please enter the corresponding values below to get your result: ')
        a = input('Value for semi-axis a: ');
b = input('Value for semi-axis b: ');
if (a<0|| b<0)
    error('Error, please enter viable values')
elseif (a>0 || b>0)
    h = ((a-b)/(a+b))^2 ;
fprintf ('The value of h is = %5.5f\n', h)
%%
P1 = pi*(a+b);
P2 = pi*(sqrt(2*((a^2)+(b^2))));
P3 = pi*(sqrt(2*((a^2)+(b^2))-((a-b)^2)/2));
P4 = pi*(a+b)*(1+h/8)^2 ;
P5 = pi*(a+b)*(1+(3*h)/(10+sqrt(4-3*h)));
P6 = pi*(a+b)*((64-3*h^2)/(64-16*h));
P7 = pi*(a+b)*((256-48*h-21*h^2)/(256-112*h+3*h^2));
P8 = pi*(a+b)*((3-sqrt(1-h))/2);

end
%%
% input values (a,b) = (1,1),(1,0.9),...(1,0.1)
fprintf('The value of the perimeter of the ellipse can be estimated as %3.4f ,or %3.4f ,or %3.4f ,or %3.4f ,or %3.4f ,or %3.4f ,or %3.4f ,or %3.4f. \n ',P1, P2, P3, P4, P5, P6, P7, P8);
A = [P1, P2, P3, P4, P5, P6, P7, P8 ];
S= std(A,0)
    otherwise
        disp('Error, there are only two questions, please type 1 or 2 accordingly');
end