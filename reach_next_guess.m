function x = reach_next_guess (x, C, route)

%l�s f(x) = 0 med Newton-Raphson
    f = @(x) total_consumption(x, route, 2^16) - C;
    fprime = @(x) consumption(velocity(x, route));

x = x - f(x)/fprime(x);

if x < 0
    x = 0;
end

end