%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         HW04
%    The Split-and-Average Problem and Runge-Kutta Radioactivity   
%                  Course: CEE/MAE M20
% 
%                  Author: Onur Calisir
%                    UID: 605-489-394
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear cache
close all
clc
%%
question = input('Please enter the number of the question(1 or 2 )\n');
switch(question)
    case 1 
       
x = [2, 2, 2, 2];
y = [2, 4, 4, 4];
w = [2, 3, 4];
plot(x, y, 'bo', 'Markersize', 5, 'MarkerFacecolor', 'b');
hold on;
axis equal;
cond= 10^(-3);
while true
    xs = splitPts(x); 
    ys = splitPts(y); 
    xa = averagePts(xs, w); 
    ya = averagePts(ys, w);
    x = xa; 
    y = ya;
  %%
    dx = xa - xs;
    dy = ya - ys;
    check =max(sqrt(dx.^2 + dy.^2));
    % check exit condition
    if (check < cond)
      break;
    end
 end

plot(xs, ys, 'ko', 'Markersize', 5, 'MarkerFacecolor', 'k');
legend('Initial Values', 'Final Values');
%%
    case 2
        t0 = 0;
        dt = 5;
        Tfinal = 15;
        y0 = 1;
        t = t0:dt:Tfinal;
        array_t = length(t);
        ye = zeros(array_t,1); ye(1) = y0;
        y1 = zeros(array_t,1); y1(1) = y0;
        y2 = zeros(array_t,1); y2(1) = y0;
        y4 = zeros(array_t,1); y4(1) = y0;
        
        for k = 1:array_t-1
            ye(k+1) = y0*exp((-log(2)/2.45)*t(k));
            y1(k+1) = advanceRK(y1(k),dt,1);
            y2(k+1) = advanceRK(y2(k),dt,2);
            y4(k+1) = advanceRK(y4(k),dt,4);
        end
        
        figure(1)
        hold on
        plot(t,ye,'g');hold on;
        plot(t,y1,'b');hold on;
        plot(t,y2,'r');hold on;
        plot(t,y4,'k');hold on;
        legend('Exact', 'RK1', 'RK2', 'RK4');
        title('dt = 1', dt);
        xlabel('Time (s)');
        ylabel('Amount of Carbon-15');
        
        err1 = mean(abs(y1 - ye));
        err2 = mean(abs(y2 - ye));
        err4 = mean(abs(y4 - ye));
        
        disp('     dt        RK1         RK2         RK4');
        fprintf('    %.2f',dt);fprintf('      %.2e',err1);fprintf('    %.2e',err2); fprintf('    %.2e\n',err4);
        
        percantage = y2(k) / y2(1) * 100;
        
        fprintf('Percentage remaining =  %.2f\n', percantage);
      %%
          t0 = 0;
        dt = 0.1;
        Tfinal = 15;
        y0 = 1;
        t = t0:dt:Tfinal;
        array_t = length(t);
        ye = zeros(array_t,1); ye(1) = y0;
        y1 = zeros(array_t,1); y1(1) = y0;
        y2 = zeros(array_t,1); y2(1) = y0;
        y4 = zeros(array_t,1); y4(1) = y0;
        
        for k = 1:array_t-1
            ye(k+1) = y0*exp((-log(2)/2.45)*t(k));
            y1(k+1) = advanceRK(y1(k),dt,1);
            y2(k+1) = advanceRK(y2(k),dt,2);
            y4(k+1) = advanceRK(y4(k),dt,4);
        end
        
        figure(2)
        hold on
        plot(t,ye,'g');hold on;
        plot(t,y1,'b');hold on;
        plot(t,y2,'r');hold on;
        plot(t,y4,'k');hold on;
        legend('Exact', 'RK1', 'RK2', 'RK4');
        title('dt = 0.1',dt);
        xlabel('Time (s)');
        ylabel('Amount of carbon-15');
        
        err1 = mean(abs(y1 - ye));
        err2 = mean(abs(y2 - ye));
        err4 = mean(abs(y4 - ye));
        
%         disp('     dt        RK1         RK2         RK4');
        fprintf('    %.2f',dt);fprintf('      %.2e',err1);fprintf('    %.2e',err2); fprintf('    %.2e\n',err4);
        
        percantage = y2(k) / y2(1) * 100;
        
        fprintf('Percentage remaining =  %.2f\n', percantage);
        
        
        %%
        t0 = 0;
        dt = 0.01;
        Tfinal = 15;
        y0 = 1;
        t = t0:dt:Tfinal;
        array_t = length(t);
        ye = zeros(array_t,1); ye(1) = y0;
        y1 = zeros(array_t,1); y1(1) = y0;
        y2 = zeros(array_t,1); y2(1) = y0;
        y4 = zeros(array_t,1); y4(1) = y0;
        
        for k = 1:array_t-1
            ye(k+1) = y0*exp((-log(2)/2.45)*t(k));
            y1(k+1) = advanceRK(y1(k),dt,1);
            y2(k+1) = advanceRK(y2(k),dt,2);
            y4(k+1) = advanceRK(y4(k),dt,4);
        end
        
        figure(3)
        hold on
        plot(t,ye,'g');hold on;
        plot(t,y1,'b');hold on;
        plot(t,y2,'r');hold on;
        plot(t,y4,'k');hold on;
        legend('Exact', 'RK1', 'RK2', 'RK4');
        title('dt = 0.01',dt);
        xlabel('Time (s)');
        ylabel('Amount of carbon-15');
        
        err1 = mean(abs(y1 - ye));
        err2 = mean(abs(y2 - ye));
        err4 = mean(abs(y4 - ye));
        
        
        fprintf('    %.2f',dt);fprintf('      %.2e',err1);fprintf('    %.2e',err2); fprintf('    %.2e\n',err4);
        
        percantage = y2(k) / y2(1) * 100;
        
        fprintf('Percentage remaining =  %.2f\n', percantage);



end
function[xs] =splitPts(x)
  % This function calculates the midpoint of every two consecutive elements 
  % in  an array using the midpoint formula; the output of  splitPts is a
  % vector with twice the number of elements as x, where midpoints are
  % inserted every-other element with a value equal to the average of the
  % neighboring elements.
  %%
 array_size=length(x);
  for i = 1:array_size
      xs(2*i - 1) = x(i);
      if i == array_size
          xs(2*i) = (x(1) + x(i))/2;  
      else
          xs(2*i) = (x(i) + x(i + 1))/2;
      end
  end
end

function[xa] =averagePts(xs,w)
  % This function calculates the weighted average of the three nearest 
  % neighbors, including the current element itself.Where w1, w2, w3 are 
  % the elements of the [1x3] input vector w, after normalization.
  % Function will assume that the vector "wraps around" on itself
  % ,such that xs(1) and xs(last) are adjacent. 
  %%
  if w(1)+w(2)+w(3) == 0
      error('Error: The sum of weights must be not be zero.\n');
  else
      w = w/sum(w);
      array_size= length(xs);
      for i = 1:array_size
          if i == 1
              start_point = array_size;
          else
              start_point = i - 1;
          end
          if i == array_size
              end_point = 1;
          else
              end_point = i + 1;
          end
          xa(i) = w(1)*xs(start_point) + w(2)*xs(i) + w(3)*xs(end_point);
      end
  end
end

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







  