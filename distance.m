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

% Use Newton-Rhapsson to find a root of the non-linear equation 
% and use that as an estimate for the distance travelled

% First guess is average speed multiplied with time to get distance
x_last_guess = 0;
x_next_guess = mean(speed_kmph) * T;
% Prevent guesses outside the interval
if (x_next_guess > max(distance_km))
    x_next_guess = max(distance_km);
elseif (x_next_guess < 0)
    x_next_guess = 0;
end

% Tolerance of 0.5m gives an answer correct to the nearest meter
tolerance = 5e-4;

while abs(x_next_guess - x_last_guess) > tolerance
    x_last_guess = x_next_guess;
    x_next_guess = distance_next_guess(x_last_guess);
    % Prevent guesses outside the interval
    if (x_next_guess > max(distance_km))
        x_next_guess = max(distance_km);
    elseif (x_next_guess < 0)
        x_next_guess = 0;
    end
end
x = x_next_guess;

end