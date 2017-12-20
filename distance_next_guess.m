function result = distance_next_guess (x, T, route)

distance_f = @(x) time_to_destination_simpson(x, route, 2.^16) - T;
distance_f_der = @(x) 1 ./ velocity(x, route);
result = x - (distance_f(x) ./ distance_f_der(x));

if result < 0
    result = 0;
end

end