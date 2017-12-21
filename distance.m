function x = distance( T, route )
%DISTANCE Calculate the distance travelled along route after time T
%   Calculate the distance travelled after a certain period of time by
%   formulating a non-linear equation and using Newton-Rhapsson to find a
%   root.
%     Input:
%         T: Time travelled (hours)
%         route: String of the route travelled
%     Output:
%         x: Distance travelled during this period

% Helper functions:
% Problem formulated as f(x) - T = 0
distance_f = @(x) time_to_destination(x, route, 2.^16) - T;
% The derivative of f(x) is 1 / velocity(x)
distance_f_der = @(x) 1 ./ velocity(x, route);
% Calculating next guess in Newton-Rhapsson
distance_next_guess = @(x) x - (distance_f(x) ./ distance_f_der(x));

% Load the data from disk
load(route);

% Calculate the time it takes to travel to the end of the route
max_time = time_to_destination(max(distance_km), route, 2^16);

% If the time is larger or equal to the maximum time it takes to travel the
% route, the distance returned is the full route
if T >= max_time
    x = max(distance_km);
    
% If time is less than or eqaul to zero, the distance travelled is zero
elseif T <= 0
    x = 0;
    
% Otherwise, use Newton-Rhapsson to find a root of the non-linear
% equation and use that as an estimate for the distance travelled
else
% Calculate the average speed for the first guess
    avrg_speed = mean(speed_kmph);
% First guess is average speed multiplied with time to get distance
    x_last_guess = -1;
    x_new_guess = avrg_speed * T;
    
% Tolerance of 0.5m gives an answer correct to the nearest meter
    tolerance = 5e-4;
    
% Keep track of iterations to prevent infinite loops
    iterations = 1;
    while iterations < 20 && abs(x_new_guess - x_last_guess) > tolerance
        x_last_guess = x_new_guess;
        x_new_guess = distance_next_guess(x_last_guess);
% Prevent negative guesses        
        if (x_new_guess < 0) ; x_new_guess = 0; end
        iterations = iterations + 1;
    end
    x = x_new_guess;
end

end

