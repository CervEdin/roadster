function x = reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here
%     input:
%         C = Charge in Wh
%         route = string pointing to the route taken
%     output:
%         x = The distance a car can go on a given charge

% Helper functions
% Problem formulated as f(x) - T = 0
f = @(x) total_consumption(x, route, 2^16) - C;
% The derivative of f(x) is 1 / velocity(x)
fprime = @(x) consumption(velocity(x, route));
% Calculating next guess in Newton-Rhapsson
f_next = @(x) x - f(x)/fprime(x);

load(route);

% First guess is the Charge (Wh) * 1/Consumption(average speed)
x_last_guess = 0;
x_next_guess = C * 1 / consumption(mean(speed_kmph));
% Prevent guesses outside the interval
if (x_next_guess > max(distance_km))
    x_next_guess = max(distance_km);
elseif (x_next_guess < 0)
    x_next_guess = 0;
end

% Tolerance in km
tolerance = 5e-4;

while abs(x_last_guess - x_next_guess) > tolerance
    x_last_guess = x_next_guess;
    x_next_guess = f_next(x_last_guess);
    
    % Prevent guesses outside the interval
    if (x_next_guess > max(distance_km))
        x_next_guess = max(distance_km);
    elseif (x_next_guess < 0)
        x_next_guess = 0;
    end
end
x = x_next_guess;

end