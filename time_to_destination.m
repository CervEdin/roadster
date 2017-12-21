function T = time_to_destination(x, route, n)
% Calculate the time it takes to travel to a given distance using the
% function 'velocity'
%   Input:
%     x: Distance (km)
%     route: The route taken, anna or elsa
%     n: Partialintervals of the integration method
%   Output:
%     T: The time taken (h)

if( x < 0 || x > max(distance_km) )
   error("The distance (x) value: " + x + " is out of bounds")
elseif (mod(n) ~= 0)
    error("The number of intervals (n) needs to be even")
end

load(route);

x_points = linspace(0, x, n+1);

% S = h/3(f(x_0)+4f(x_1)+2f(x_2)+...+4f(x_n-1)+f(x_n))
y_points = velocity(x_points, route).^(-1);
third_of_interval = (x_points(2) - x_points(1))/3;

weights=ones(size(x_points))*2;
weights(2:2:end) = 4;
weights(1)=1;
weights(end)=1;

T=third_of_interval*weights*y_points';

end