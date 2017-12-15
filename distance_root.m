function x = distance_root( T, route )
%DISTANCE_ROOT Summary of this function goes here
%   Detailed explanation goes here

load(route);

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
    tol = 5e-4;
    %l�s f(x) = 0 med Newton-Raphson
    %anv�nd f o fprim
    f = @(x) time_to_destination_simpson(x, route, 2^16) - T;
    fprime = @(x) 1/velocity(x, route);
    x_prev = 1;
    x_curr = x_prev - (f(x_prev)/fprime(x_prev));

    while abs(x_curr-x_prev) > tol
        x_prev = x_curr;
        x_curr = x_prev - (f(x_prev)/fprime(x_prev));
    end
    x = x_prev;
end


end

