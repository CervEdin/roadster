function x = distance_root( T, route )
%DISTANCE_ROOT Summary of this function goes here
%   Detailed explanation goes here
distance_f = @(x) time_to_destination_simpson(x, route, 2.^16) - T;
distance_f_der = @(x) 1 ./ velocity(x, route);
distance_next_guess = @(x) x - (distance_f(x) ./ distance_f_der(x));

load(route);

% OBS n�got skiter sig vid T 0.02 - 0.03 f�r speed_elsa

% b�rja med att ber�kna tiden f�r hela str�ckan T(end)
max_time = time_to_destination_simpson(max(distance_km), route, 2^16);
min_time = time_to_destination_simpson(min(distance_km), route, 2^16);
%b�rja med att ber�kna tiden f�r hela str�ckan T(end)
if T > max_time
   x = max_time;
elseif T <= min_time
   x = min_time;
else
    %hitta startgissning x0
    %f�r att hitta startgissning:
    %1. ber�kna medelhastigheten V0
    %2. X0 = V0*T
    % ATT G�RA
    % b�rja med x0 = 1
    x_first_guess = 1;
    
    % Do once outside loop?
    x_last_guess = x_first_guess;
    x_new_guess = distance_next_guess(x_last_guess);
    
    % Tolerans 0.5m ger svar exakt till en meters marginal
    tolerance = 5e-4;
    
    %l�s f(x) = 0 med Newton-Raphson
    %anv�nd f o fprim

    while abs(x_new_guess - x_last_guess) > tolerance
        x_last_guess = x_new_guess;
        x_new_guess = distance_next_guess(x_last_guess);
    end
    x = x_last_guess;
end


end

