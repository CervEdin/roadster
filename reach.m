function x = reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here
%     input:
%         C = Wh
%         route = string pointing to the route taken
%     output:
%         x = The distance a car can go on a given charge
        

load(route);

max_consumption = total_consumption_simpson(max(distance_km), route, 2^16);
if C > max_consumption
   x = max(distance_km);
elseif C <= 0
   x = 0;
else
    %startgissningen är medeldistansen
    x_first_guess = mean(distance_km);
   
    x_last_guess = x_first_guess;
    x_next_guess = reach_next_guess(x_last_guess, C, route);
    
    %Vad ska tolerance vara?
    % Hmm.. En Wh låter rimligt?
    tolerance = 1;
    
    iterations = 1;

    while iterations < 20 && abs(x_last_guess - x_next_guess) > tolerance
        x_last_guess = x_next_guess;
    x_next_guess = reach_next_guess(x_last_guess, C, route);
    end
    x = x_last_guess;
end

end