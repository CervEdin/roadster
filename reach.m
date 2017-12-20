function x = reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here

load(route);

max_consumption = total_consumption_simpson(max(distance_km), route, 2^16);
if C > max_consumption
   x = max_consumption;
elseif C <= 0
   x = 0;
else
    %startgissningen är medeldistansen
    X0 = mean(distance_km);
    tol = 5e-4;
    %lös f(x) = 0 med Newton-Raphson
    f = @(x) total_consumption_simpson(x, route, 2^16) - C;
    fprime = @(x) consumption(velocity(x, route));
    x_prev = X0;
    x_curr = x_prev - (f(x_prev)/fprime(x_prev));

    while abs(x_curr-x_prev) > tol
        x_prev = x_curr;
        x_curr = x_prev - (f(x_prev)/fprime(x_prev));
    end
    x = x_prev;
end

end