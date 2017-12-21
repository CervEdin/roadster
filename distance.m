function x = distance( T, route )
%DISTANCE_ROOT Summary of this function goes here
%   Detailed explanation goes here

% Ta bort dessa funktionerna och l�gg i separat funktion som kollar att n�sta gissning inte �r negativ %
% distance_f = @(x) time_to_destination(x, route, 2.^16) - T;
% distance_f_der = @(x) 1 ./ velocity(x, route);
% distance_next_guess = @(x) x - (distance_f(x) ./ distance_f_der(x));

load(route);

% OBS n�got skiter sig vid T 0.02 - 0.03 f�r speed_elsa

% b�rja med att ber�kna tiden f�r hela str�ckan T(end)
max_time = time_to_destination(max(distance_km), route, 2^16);

% If the time is larger or equal to the maximum time it takes to travel the
% route, the distance returned is the full route
if T >= max_time
   x = max(distance_km);
   
% If time is less than or eqaul to zero, the distance travelled is zero
elseif T <= 0
   x = 0;
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
        x_new_guess = distance_next_guess(x_last_guess, T, route);
        iterations = iterations + 1;
    end
    x = x_new_guess;
end

end

