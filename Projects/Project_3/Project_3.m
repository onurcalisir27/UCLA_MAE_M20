%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        HW03
%       The Three Species Problem and the Pocket Change Problem   
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
% x_new = x_old + delta_t*x_old*(0.7- 0.035*x_old- 1.25*y_old- 0.45*z_old)      
% y_new = y_old + delta_t*y_old*(1 -(0.04*y_old) -0.75x_old - 1.25*z_old )
% z_new = z_old + delta_t*z_old*(1.5 -0.05*z_old - x_old - y_old)

x_old = 2;
y_old = 2.49;
z_old = 1.5;
T_final= 12;
delta_t=0.005;
t_steps= ceil(T_final/delta_t);
t=0;
%%
tic
fprintf('Time     X       Y       Z\n\n')
for k=1:t_steps
x_new= x_old + delta_t*x_old*(0.7- 0.035*x_old- 1.25*y_old- 0.45*z_old);      
y_new= y_old + delta_t*y_old*(1 -0.04*y_old -0.75*x_old - 1.25*z_old);
z_new= z_old + delta_t*z_old*(1.5 -0.05*z_old - x_old - y_old);

fprintf('%.3f   %.2f    %.2f    %.2f\n',t,x_old,y_old,z_old)
x_old=x_new;
y_old=y_new;
z_old=z_new;
t=t+delta_t;

end
toc
%%

%values for x=6 y=3 z=3
%results: only species X survives

%for values for x=3 y=3 z=3
%results: only species Z survives

%for values x=4 y=4 z=2
%results: only species Y survive


%for delta_t=0.005 only species Y survives; for delta_t=0.05, after
%t=0.6.35 only species Y survives as well.
%%
    case 2
    
CoinCount=0;      
for i = 0:99
change=i;
quarters=0;
dimes=0;
nickels=0;
pennies=0;
        Q=25;
        D=10;
        N=5;
        P=1;
       
    while (change>0)
        if (change >=Q)
            quarters=quarters +1;
            change=change-Q;
        elseif (change>=D && change<Q)
            dimes=dimes+1;
            change=change-D;
        elseif (change>=N && change<D)
            nickels= nickels+1;
            change=change-N;
        elseif (change>=P && change<N)
            pennies=pennies+1;
            change= change-1;
        end
    end
CoinCount=CoinCount+quarters+dimes+nickels+pennies;
end

ave_coin = CoinCount/100;
fprintf('Average amount of coins used: %.2f\n',ave_coin)
    otherwise
        Error('Please enter 1 or 2')
end
