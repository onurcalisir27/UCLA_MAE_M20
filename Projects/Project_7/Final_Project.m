%=========================================================================
%   Final Project
%   Course MAE/CEE M20
%   Author: ONUR CALISIR
%   UID:605489394
%   Date: 3/11/2022
%==========================================================================
%Clean Workspace and Command Window
clc
clear all
close all
%%
%MAIN SCRIPT==============================================================
%Values stated in Table 1 are sorted into trials here.
trial=input('Please enter the trial number you would like to see the simulation for(1,2,3)\n');
switch(trial)
    case 1
        map_x_min=0; map_x_max=1000; map_y_min=0; map_y_max=300;
        wall_x_min=450; wall_x_max=550; wall_y_min=75; wall_y_max=225;
        exit_x_min=950; exit_x_max=1000; exit_y_min=250; exit_y_max=300;
    case 2
        map_x_min=0; map_x_max=1000; map_y_min=0; map_y_max=500;
        wall_x_min=450; wall_x_max=550; wall_y_min=75; wall_y_max=425;
        exit_x_min=950; exit_x_max=1000; exit_y_min=450; exit_y_max=500;
    case 3
        map_x_min=0; map_x_max=1000; map_y_min=0; map_y_max=500;
        wall_x_min=450; wall_x_max=550; wall_y_min=75; wall_y_max=425;
        exit_x_min=950; exit_x_max=1000; exit_y_min=250; exit_y_max=300;
    otherwise
        Error('Please Enter 1,2, or 3')
end

%Instead of creating the matrices as
%[x_position,y_position,x_length,y_length], this format is used because
%these values provide better information for our functions.
ball_x=50; ball_y=50; ball_r=25; ball_v=100;
map =  [map_x_min, map_x_max; map_y_min, map_y_max];
wall = [wall_x_min, wall_x_max; wall_y_min, wall_y_max];
exit = [exit_x_min, exit_x_max; exit_y_min, exit_y_max];

% Setting Trial Parameters
n_trials=10;
max_iter=5000;
dt=0.1;
max_t = max_iter*dt;

% Storing trial angles
trials = zeros(1,10);

% Iterating Over Each Trial
for k=1:n_trials
for i = 1:1:10000
    
    % Setting Initial Robot Information Including its Direction
    ball_angle = 90*rand;
    ball_vx = ball_v*cosd(ball_angle);
    ball_vy = ball_v*sind(ball_angle);
    ball = [ball_x, ball_y, ball_r, ball_vx, ball_vy];
   
    % Run Current Trial
    t = run_trial(map, wall, ball, exit, dt, max_t, 1);
  
    % Checking Trial Conditions
    if t < max_t
        max_t = t;
        best_angle = ball_angle;
    end
end

trials(k) = best_angle;
end

fprintf('The best angle is = %f\n',median(trials));
fprintf('The time to exit is = %f\n', t);

%%
%FUNCTIONS================================================================
%Function 0 - Draw Cir
function draw_cir(x,y,r,c)
%   draw_cir Plots a Empty Circle based on its coordinate and radius
%       draw_cir(x,y,r,c) plots One Circle
%       there is no numeric output
%       input 1 (x) is x-coordinate for the Center of the Circle
%       input 2 (y) is y-coordinate for the Center of the Circle
%       input 3 (r) is Radius of the Circle
%       input 4 (c) is the color code used on the Circle Boundary
    hold on
    %   Scale number of points to draw the circle according to its
    %   circumference
    n = ceil(2*pi*r);
    if n < 100; n = 100; end
    %   Set vector holder for x and y coordinate of the circle
    cir_x = zeros(n+1,1);
    cir_y = zeros(n+1,1);   
    %   Plot each individual point of the circle
    for i = 1:1:n
        theta = 2*pi/n;
%         scatter(x + r*cos(theta*i),y + r*sin(theta*i),c,'MarkerFaceColor',c)
        cir_x(i) = x + r*cos(theta*i);
        cir_y(i) = y + r*sin(theta*i);
    end
    
    %   Complete the Circle by Cycling to the First Point
    cir_x(n+1) = cir_x(1);
    cir_y(n+1) = cir_y(1);
    
    fill(cir_x,cir_y,c)
    hold off 
end
%=========================================================================
%Function 0 - Draw Rec
function draw_rec(x,y,l,w,c)
%   draw_rec Plots a Empty Rectangular Box based on 4 sides
%       draw_rec(x,y,l,w,c) plots One Rectangle
%       there is no numeric output
%       input 1 (x) is x-coordinate for the Center of the Rectangle
%       input 2 (y) is y-coordinate for the Center of the Rectangle
%       input 3 (l) is horizontal size of the Rectangle
%       input 4 (w) is vertical size of the Rectangle
%       input 5 (c) is the color code used on the Rectangle Edges
    
    hold on
    %   Plot the Bottom Line
    plot([x-l/2,x+l/2],[y-w/2,y-w/2],c,'LineWidth',3)
    %   Plot the Top Line
    plot([x-l/2,x+l/2],[y+w/2,y+w/2],c,'LineWidth',3)
    %   Plot the Left Line
    plot([x-l/2,x-l/2],[y-w/2,y+w/2],c,'LineWidth',3)
    %   Plot the Right Line
    plot([x+l/2,x+l/2],[y-w/2,y+w/2],c,'LineWidth',3)
    hold off

end
%==========================================================================
%Function 1 - Plot Map
function plot_map(map, wall, ball, exit)
    % Read map corrdinates and plot map boundary (draw_rec),
    % Read wall corrdinates and draw wall (draw_rec),
    % Read exit corrdinates and draw wall (draw_rec),
    % Read ball corrdinates and draw wall (draw_cir)
    
    hold on
    draw_rec((map(1,1)+map(1,2)/2) ,(map(2,1)+map(2,2)/2) ,map(1,2) ,map(2,2) ,'k');
    draw_rec((wall(1,1)+wall(1,2))/2, (wall(2,1)+wall(2,2))/2, wall(1,2)-wall(1,1), wall(2,2)-wall(2,1),'g');
    draw_rec((exit(1,1)+exit(1,2))/2, (exit(2,1)+exit(2,2))/2, exit(1,2)-exit(1,1), exit(2,2)-exit(2,1),'r');
    draw_cir(ball(1,1),ball(1,2),ball(1,3),'b');
    axis equal
    drawnow
end
%=========================================================================
%Function 2 - Check Collision
function collision_flag = check_collisions(map, wall, ball, dt)
    % Evaluates the balls position in every iteration in order to detect if the
    % ball collides with a boundary element. Collision would mean same x or y
    % values for position of the ball and a wall or the boundary in a given 
    % iteration.
    %Inputs
    map_x_min = map(1,1); 
    map_x_max = map(1,2);
    map_y_min = map(2,1);
    map_y_max = map(2,2);
    wall_x_min = wall(1,1);
    wall_x_max = wall(1,2);
    wall_y_min = wall(2,1);
    wall_y_max = wall(2,2);
    ball_x = ball(1);
    ball_y = ball(2);
    ball_r = ball(3);
    ball_vx = ball(4);
    ball_vy = ball(5);
    
    coll_flag=0;
   
    if ball_x <= wall_x_min && ball_x + ball_r + ball_vx*dt >= wall_x_min && ball_y...
            + ball_r >= wall_y_min && ball_y - ball_r <= wall_y_max
     coll_flag = 1;
   
    elseif ball_x >= wall_x_max && ball_x - ball_r + ball_vx*dt <= wall_x_max && ball_y...
            + ball_r >= wall_y_min && ball_y - ball_r <= wall_y_max
        coll_flag=2;
    
    elseif  ball_y <= wall_y_min && ball_y + ball_r + ball_vy*dt >= wall_y_min && ball_x...
            + ball_r >= wall_x_min && ball_x - ball_r <= wall_x_max
        coll_flag=3;
    
    elseif  ball_y >= wall_y_max && ball_y - ball_r + ball_vy*dt <= wall_y_max && ball_x...
            + ball_r >= wall_x_min && ball_x - ball_r <= wall_x_max
            coll_flag=4;
    
    elseif ball_x >= map_x_min && ball_x - ball_r + ball_vx*dt <= map_x_min && ball_y + ball_r >= map_y_min && ball_y - ball_r <= map_y_max
        coll_flag=5;
    
    elseif ball_x <= map_x_max && ball_x + ball_r + ball_vx*dt >= map_x_max && ball_y...
            + ball_r >= map_y_min && ball_y - ball_r <= map_y_max
        coll_flag=6;
    
    elseif ball_y >= map_y_min && ball_y - ball_r + ball_vy*dt <= map_y_min && ball_x...
             + ball_r <= map_x_max && ball_y - ball_r >= map_y_min
        coll_flag=7;
    
    elseif ball_y <= map_y_max && ball_y + ball_r + ball_vy*dt >= map_y_max && ball_x...
            + ball_r <= map_x_max && ball_y - ball_r >= map_y_min
        coll_flag=8;
    end
    collision_flag=coll_flag;
end
%=========================================================================
%Function 3 - Update Map
function ball = update_map(ball, dt, collision_flag)
    %In case of an collision, the value of collision_flag determines the nature
    %of the collision. The velocity of the ball after the said collision is
    %editted as in the function.
    %Inputs
    ball_x = ball(1);
    ball_y = ball(2);
    ball_r = ball(3);
    ball_vx = ball(4);
    ball_vy = ball(5);   
    switch (collision_flag)
     case 1
        ball_vx=-ball_vx;
     case 2
        ball_vx=-ball_vx;
     case 3
        ball_vy=-ball_vy;
     case 4
        ball_vy=-ball_vy;
     case 5 
        ball_vx=-ball_vx;
     case 6 
        ball_vx=-ball_vx;
     case 7
        ball_vy=-ball_vy;
     case 8 
        ball_vy=-ball_vy;
     otherwise            
        ball_x = ball_x + ball_vx*dt;
        ball_y = ball_y + ball_vy*dt;
     end
       ball = [ball_x, ball_y, ball_r, ball_vx, ball_vy];
end
%==========================================================================
%Function 4 - Run Trial
%Uses all the other functions to create the simulation. Uses plot_map to
%create the map,check_collisions to evaulate if there was a collision in
%the iteration and update_map to edit the velocity for the next iteration.
function time_to_exit = run_trial(map, wall, ball, exit, dt, max_t, disp_flag)
   
    iteration=0;
    t=0;
    if disp_flag == 1
       
        plot_map(map,wall,ball,exit) 
    end
    exit_flag = 0;
    while exit_flag == 0 && t <= max_t
    iteration = iteration + 1;
    t = t + dt;
    % Check Collision and Set Flag 
    collision_flag = check_collisions(map, wall, ball, dt) ;
    % Update map 
    ball = update_map(ball, dt, collision_flag);
        if disp_flag == 1
            clf
            plot_map(map,wall,ball,exit)
        end
    % Check for exit condition
       if ball(1) >= exit(1,1) && ball(1) <= exit(1,2) && ball(2) >= exit(2,1) && ball(2) <= exit(2,2) 
           exit_flag = 1;     
       end
    time_to_exit = t;
    end
end
