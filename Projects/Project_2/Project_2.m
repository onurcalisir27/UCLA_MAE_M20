%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        HW2
%       Lunar Phase Calculator and Neighbor Identification   
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
question = input('Please enter the number of the question you would like to see the code for\n');
switch(question)
    case 1 
        disp('Welcome to this algorithm, please enter the corresponding inputs below to get your result: ')
         MMM = input('Please enter the month as MMM (e.g. DEC):', 's');
         DD = input('Please enter the day as DD (e.g. 12):', 's');
         YYYY = input('Please enter the year as YYYY (e.g. 2021):', 's');
          if length(YYYY)==4
            yr = str2double(YYYY);
          end
            if (yr<1900 || yr>9999)
                Error('Please check your year input.');
            end

             if length(MMM)==3
            switch MMM
                case 'JAN'  
                    mo = 1;
                case 'FEB'  
                    mo = 2;
                case 'MAR' 
                    mo = 3;
                case 'APR' 
                    mo = 4;
                case 'MAY' 
                    mo = 5;
                case 'JUN'  
                    mo = 6;
                case 'JUL' 
                    mo = 7;
                case 'AUG' 
                    mo = 8;
                case 'SEP' 
                    mo = 9;
                case 'OCT'  
                    mo = 10;
                case 'NOV' 
                    mo = 11;
                case 'DEC' 
                    mo = 12;
                otherwise
                    error('Error: Please check your month input.');
            end
             end
             if (mo==1|| mo==3||mo==5||mo==7||mo==8||mo==10||mo==12)
                 Max_day=31;
             else 
                 Max_day=30;
             end
              leapyear = (mod(yr,4)==0) && (mod(yr,100)~=0) || (mod(yr,400)==0);
        if mo==2
            if leapyear==1
                Max_day = 29;
            else
                Max_day = 28;
            end
        end
          if length(DD)==2
            dy = str2double(DD);
            if dy<=0 || dy>Max_day
                Error('Error: Please check day input.');
            end
        else
            Error('Error: Please check day input.');
          end
          if (mo==1 || mo==2)
            a = 1;
        else
            a = 0;
          end
        m = mo + 12*a - 3;
        y = yr - a + 4800;
        %for 
        J = dy + floor((153*m + 2)/5) + 365*y + floor(y/4) - floor(y/100) + floor(y/400) - 32045;
        J0 = 2415021;
        %change in J is given an dltJ.
        dltJ = J - J0;
        %Calculating the illumination
         T = 29.530588853;
        L = (sin(pi*((mod(dltJ,T))/T)))^2;
        illumination = L*100;
        if(L<0||L>1)
            Error('Illuminatio value not applicable')
        end
       
        %reporting results
        fprintf('%s %s %s\n', MMM, DD, YYYY);
        fprintf('Illumination = %0.1f %%\n', illumination);
        if (mod(dltJ,T))/T < 0.5
            fprintf('Waxing');
         else
            fprintf('Waning');
        end

    case 2
        disp('Welcome to this algorithm, please enter the corresponding values below to get your result: ')
         M = input('Value of M:');
        if (M <= 1) || abs(M - floor(M)) > 1e-10
            fprintf('Error: Please check user input.');
        end
        N = input('Value of N:');
        if (N <= 1) || abs(N - floor(N)) > 1e-10
            fprintf('Error: Please check user input.');
        end
        P = input('Value of P:');
        if (P < 1) || abs(M - floor(M)) > 1e-10 || (P > M*N)
            fprintf('Error: Please check user input.');
        end
        %the neighbor locations in the system
        up = P - 1;
        down = P + 1;
        left = P - M;
        right = P + M;
        upleft = P - M - 1;
        upright= P + M - 1;
        downleft = P - M + 1;
        downright = P + M + 1;

%to find where our P is. 3 neighbors for corners, 5 neighbors for walls and
%8 neighbors for middle points.
        if P==1
            Neighbors = [down, right, downright];
        elseif P==M
            Neighbors = [up, upright, right];
        elseif P==M * (N - 1) + 1
            Neighbors = [left, downleft, down];
        elseif P==M*N
            Neighbors = [left, upleft, up];
        elseif (P > 1) && (P < M)
            Neighbors = [up, down, upright, right, downright];
        elseif (P > (M * (N - 1) + 1)) && (P < M*N)
            Neighbors = [upleft, left, downleft, up, down];
        elseif mod(P, M) == 1
            Neighbors = [left, downleft, down, right, downright];
        elseif mod(P, M) == 0
            Neighbors = [upleft, left, up, upright, right];
        else
            Neighbors = [upleft, left, downleft, up, down, upright, right, downright];
        end
        fprintf('Cell ID:  %d\n', P);
        for i = 1:1:length(Neighbors)
   
            fprintf(' %1d', Neighbors(i));
        end
        
% A linear indexing scheme for 3D could be to use a xyz coordinate system.
% A rectangular shape can be coded with lenght values M, N, K and P would
% consist of 3 coordinates. It would be need to create further code for all
% 6 face surfaces and then another one for inside the cube. It could be
% analysed as 2D linear schemes as MxN,NxK,MxK.

end