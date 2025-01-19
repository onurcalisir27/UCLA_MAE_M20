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
        
%%
n_steps=300;
num_rows=150;
num_cols=200;
A=rand(num_rows,num_cols)>0.9;
figure(1)
        imagesc(A)
        drawnow
        pause(1)
       
A_new=zeros(num_rows,num_cols);

for k=1:n_steps
    for i=1:num_cols
        for j=1:num_rows

           if j==1 && i==1
            A_north=A(150,1);
            A_south=A(2,1);  
            A_east=A(1,2);
            A_west=A(1,200);
            A_noreas=A(150,2);
            A_norwes=A(150,200);
            A_soueas=A(2,2);
            A_souwes=A(2,200);
         
           elseif j==150 && i==1
            A_north=A(j-1,i);
            A_south=A(1,1);  
            A_east=A(j,i+1);
            A_west=A(150,200);
            A_noreas=A(j-1,i+1);
            A_norwes=A(149,200);
            A_soueas=A(1,2);
            A_souwes=A(1,200);

           elseif j==1 && i==200
            A_north=A(150,200);
            A_south=A(j+1,i);  
            A_east=A(1,1);
            A_west=A(j,i-1);
            A_noreas=A(150,1);
            A_norwes=A(150,199);
            A_soueas=A(2,1);
            A_souwes=A(j+1,i-1);

           elseif j==150 && i==200

            A_north=A(j-1,i);
            A_south=A(1,200);  
            A_east=A(150,1);
            A_west=A(j,i-1);
            A_noreas=A(149,1);
            A_norwes=A(j-1,i-1);
            A_soueas=A(1,1);
            A_souwes=A(1,199);

           elseif j==1 && 1<i && i<200
            A_north=A(150,i);
            A_south=A(j+1,i);  
            A_east=A(j,i+1);
            A_west=A(j,i-1);
            A_noreas=A(150,i+1);
            A_norwes=A(150,i-1);
            A_soueas=A(j+1,i+1);
            A_souwes=A(j+1,i-1);

           elseif j==150 && 1<i && i<200
            A_north=A(j-1,i);
            A_south=A(1,i);  
            A_east=A(j,i+1);
            A_west=A(j,i-1);
            A_noreas=A(j-1,i+1);
            A_norwes=A(j-1,i-1);
            A_soueas=A(1,i+1);
            A_souwes=A(1,i-1);

           elseif i==1 && 1<j && j<150
            A_north=A(j-1,i);
            A_south=A(j+1,i);  
            A_east=A(j,i+1);
            A_west=A(j,200);
            A_noreas=A(j-1,i+1);
            A_norwes=A(j-1,200);
            A_soueas=A(j+1,i+1);
            A_souwes=A(j+1,200);

           elseif i==200 && 1<j && j<150
            A_north=A(j-1,i);
            A_south=A(j+1,i);  
            A_east=A(j,1);
            A_west=A(j,i-1);
            A_noreas=A(j-1,1);
            A_norwes=A(j-1,i-1);
            A_soueas=A(j+1,1);
            A_souwes=A(j+1,i-1);

           else     
          
            A_north=A(j-1,i);
            A_south=A(j+1,i);  
            A_east=A(j,i+1);
            A_west=A(j,i-1);
            A_noreas=A(j-1,i+1);
            A_norwes=A(j-1,i-1);
            A_soueas=A(j+1,i+1);
            A_souwes=A(j+1,i-1);
           end
                                 
            sumNeigbors=A_east+A_west+A_south+A_north+A_souwes+A_soueas+A_noreas+A_norwes;
         
            if A(j,i)==1
                if sumNeigbors==2||sumNeigbors==3
                    A_new(j,i)=1;
                else
                    A_new=0;
                end
            end
            if A(j,i)==0
                if sumNeigbors==3
                    A_new(j,i)=1;
                else
                    A_new(j,i)=0;
                end     
            end 

        end
       
    end   
                A=A_new; 
            imagesc(A)
            drawnow

            
end

       case 2

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