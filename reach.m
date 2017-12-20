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
    x_first_guess = mean(distance_km);
   
    %lös f(x) = 0 med Newton-Raphson
    f = @(x) total_consumption_simpson(x, route, 2^16) - C;
    fprime = @(x) consumption(velocity(x, route));
    x__new_guess = x_first_guess;
    x__last_guess = x__new_guess - (f(x__new_guess)/fprime(x__new_guess));
    
    %Vad ska tolerance vara?
    tolerance = 1;
    
    iterations = 1;

    while iterations < 20 && abs(x_new_guess - x_last_guess) > tolerance
        x__new_guess = x__last_guess;
        x__last_guess = x__new_guess - (f(x__new_guess)/fprime(x__new_guess));
    end
    x = x__new_guess;
end

end