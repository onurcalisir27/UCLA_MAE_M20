%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        HW 05
%      The Shared Birthday Problem and Random Walk Collisions  
%                 Course: CEE/MAE M20
% 
%                 Author: Onur Calisir
%                   UID: 605-489-394
%
%%
clear cache
close all
clc
rng("shuffle")
%%
question = input('Please enter the number of the question you would like to see the code for\n');
switch(question)
    case 1 
         N = 1e4;
         n_array = zeros(N,1);
       
        for k = 1:N
           match_found = 0;  
            cycle = 1;
            max_cycle = N;
            group = ceil(rand*365);
            while match_found == 0 && cycle < max_cycle
                i = i + 1;
                newcomer = ceil(rand*365);
                for i = 1:length(group)
                    if abs(newcomer - group(i)) < 7 || abs(newcomer - group(i) + 365) < 7 || abs(newcomer - group(i) - 365) < 7
                        match_found = 1;
                    end
                end
                new_group = [group; newcomer];
                group = new_group; 
                
            end
            n_array(k) = i;
        end
        
        median_value = round(median(n_array));

        fprintf('Median Number of People = %.0f\n', median_value);
        array_size = max(n_array) - min(n_array);
        histogram(n_array,array_size);
        xlabel('Number of People');
        ylabel('Count');
        
    case 2
                walks = 5000;
                N_array = zeros(walks,1);
                
                for trial = 1:walks
                   k = 0; collisionfound = 0;
                   x1 = -5; x1k = x1;
                   y1 = 0; y1k = y1;
                   x2 = 5; x2k = x2;
                   y2 = 0; y2k = y2;
                   Wall = [5,-5,-5,5];  
                   steps = 1000;                                    
                                                                                                                                 
                    while collisionfound == 0 && k < steps
                        [x1k_next,y1k_next] = RandomWalk(x1k,y1k,Wall);
                        [x2k_next,y2k_next] = RandomWalk(x2k,y2k,Wall);
                        
                        x1k_val = [x1k-0.5, x1k+0.5, x1k+0.5, x1k-0.5];
                        y1k_val = [y1k-0.5, y1k-0.5, y1k+0.5, y1k+0.5];
                        
                        x2k_val = [x2k-0.5, x2k+0.5, x2k+0.5, x2k-0.5];
                        y2k_val = [y2k-0.5, y2k-0.5, y2k+0.5, y2k+0.5];
                        
                        x1k_next_val = [x1k_next-0.5, x1k_next+0.5, x1k_next+0.5, x1k_next-0.5];
                        y1k_next_val = [y1k_next-0.5, y1k_next-0.5, y1k_next+0.5, y1k_next+0.5];
                        
                        x2k_next_val = [x2k_next-0.5, x2k_next+0.5, x2k_next+0.5, x2k_next-0.5];
                        y2k_next_val = [y2k_next-0.5, y2k_next-0.5, y2k_next+0.5, y2k_next+0.5];
%%                        
                          figure(2)
                        hold on
                        grid on
                        axis square
                        title('Random Walk Collisions',k)
                        xlim([-5.5 5.5])
                        ylim([-5.5 5.5])
                        
                        fill(x1k_val,y1k_val,'m')
                        fill(x1k_next_val,y1k_next_val,'b')
                        fill(x2k_val,y2k_val,'y')
                        fill(x2k_next_val,y2k_next_val,'r')
                        if (x1k_next == x2k_next) && (y1k_next == y2k_next)
                            fill(x1k_next_val, y2k_next_val, 'g');
                        end
                        hold off
                        
                        x1k = x1k_next; y1k = y1k_next;
                        x2k = x2k_next; y2k = y2k_next;
                         k = k + 1;
                          
                        if x1k == x2k && y1k == y2k
                            collisionfound = 1;
                          N_array(trial) = k;
                            break                                                           
                        end                                                                                                                
                    end
               end
                
                median_value=round(median(N_array));
                fprintf('Median = %.0f\n', median_value);
     
end