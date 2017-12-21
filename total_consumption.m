function E  = total_consumption( x, route, n )
% Approximates the total energy consumption for a given distance along
% a certain route using the functions 'velocity' and 'consumption'
%     Input:
%       x: Distance (km)
%       route: Route taken 'anna' or 'elsa'
%       n: Amount of partial intervals
%     Output:
%       E: Total energy consumption (Wh)

if( x < 0 || x > max(distance_km) )
    error("The distance (x) value: " + x + " is out of bounds")
elseif (mod(n) ~= 0)
    error("The number of intervals (n) needs to be even")
end

load(route);

x_points = linspace(0, x, n+1);

% S = h/3(f(x_0)+4f(x_1)+2f(x_2)+...+4f(x_n-1)+f(x_n))
y_points = consumption(velocity(x_points, route));
third_of_interval = (x_points(2) - x_points(1)) / 3;

weights = ones(size(x_points)) * 2;
weights(2 : 2 : end) = 4;
weights(1) = 1;
weights(end) = 1;

E = third_of_interval * weights * y_points';
end