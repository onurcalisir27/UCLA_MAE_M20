%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        HW06
%      The Game of Life and Euler-Bernoulli Beam Bending
%                 Course: CEE/MAE M20
% 
%                 Author: Onur Calisir
%                   UID: 605-489-394
%
%%
clear cache
close all
clc
%%
question = input('Please enter the number of the question(1 or 2 )\n');
switch(question)
    case 1 
    % Game of Life        
    n_steps = 300;
    num_rows = 150;
    num_cols = 200;
    
    % Initialize random grid
    A = rand(num_rows, num_cols) > 0.9;
    figure(1);
    imagesc(A);
    title('Game of Life');
    drawnow;
    pause(1);
    
    % Iterate for each step
    for k = 1:n_steps
        A_new = zeros(num_rows, num_cols); % Create a new matrix for updates
        
        for j = 1:num_rows
            for i = 1:num_cols
                % Wrap-around indices for neighbors
                north = mod(j - 2, num_rows) + 1; % Row above
                south = mod(j, num_rows) + 1;    % Row below
                west = mod(i - 2, num_cols) + 1; % Column left
                east = mod(i, num_cols) + 1;    % Column right
                
                % Diagonal neighbors
                northwest = A(north, west);
                northeast = A(north, east);
                southwest = A(south, west);
                southeast = A(south, east);
                
                % Cardinal neighbors
                N = A(north, i);
                S = A(south, i);
                W = A(j, west);
                E = A(j, east);
                
                % Sum neighbors
                sum_neighbors = N + S + W + E + northwest + northeast + southwest + southeast;
                
                % Apply Game of Life rules
                if A(j, i) == 1
                    if sum_neighbors == 2 || sum_neighbors == 3
                        A_new(j, i) = 1; % Survive
                    else
                        A_new(j, i) = 0; % Die
                    end
                elseif A(j, i) == 0
                    if sum_neighbors == 3
                        A_new(j, i) = 1; % Reproduction
                    else
                        A_new(j, i) = 0; % Stay dead
                    end
                end
            end
        end
        
        % Update grid
        A = A_new;
        imagesc(A);
        title(['Step ', num2str(k)]);
        drawnow;
    end

   case 2
    % Beam Bending
    L = 2;
    R = 0.015;
    r = 0.005;
    P = -2000;
    d = (2/3)*L;
    E = 68.9*10^9;
    I = (pi/4)*(R^4 - r^4);
    x=linspace(0,L,20);
    dx = L/(20 - 1);
    %%
    A = zeros(20,20);
    A(1,1) = 1;
    A(20,20) = 1;       
    for i = 2:20 - 1
        A(i,i-1) = 1;
        A(i,i) = -2;
        A(i,i+1) = 1;
    end
   %%
    M = zeros(20,1);
    for i = 1:20
        if x(i) <= d
            M(i) = -P*(L-d)*x(i)/L;
        else
            M(i) = -P*d*(L-x(i))/L;
        end
    end
    
    b = (dx^2)*M/(E*I);
    %%
    y = A\b;
    c= min(d,L-d);
    y_max = (P*c*(L^2 - c^2)^1.5)/(9*sqrt(3)*E*I*L);
    fprintf('Maximum Bending Calculated: %0.5f\n',abs(min(y)));
    error = abs(((y_max - min(y))/y_max)*100);
    fprintf('Percent Error: %0.5f %%', error);
    %%
    figure(1)
    plot(x,y,'o-')
    xlabel('X Position')
    ylabel('Displacement')
    title('Beam Bending Graph')

end
