function v = velocity(x, route)

% x is the distance travelled along a route
% route is a string for the route file 'speed_anna' or 'speed_elsa'

% Check the route and load appropriate data
if strcmp(route, 'speed_anna')
    scope = load('speed_anna.mat');
elseif strcmp(route, 'speed_elsa')
    scope = load('speed_elsa.mat');
else
    error("Route has to be either 'speed_anna' or 'speed_elsa'")
end

assert( x >= 0 && x <= scope.distance_km(length(scope.distance_km)));

%plot(scope.distance_km, scope.speed_kmph)

%i = 1;
%while( x > scope.distance_km(i) && x > scope.distance_km(i + 1))
%    i = i + 1;
% end
% x_values = [scope.distance_km(i), scope.distance_km(i + 1)];
% y_values = [scope.speed_kmph(i), scope.speed_kmph(i + 1)];
% polynom = polyfit(x_values, y_values, 1);
%v = polyval(polynom, x);

% polynom = spline(scope.distance_km, scope.speed_kmph)
% 
% v = ppval(polynom, x);

v = spline(scope.distance_km, scope.speed_kmph, x);

end