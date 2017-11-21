function v = velocity(x, route)
%VELOCITY  Approximate the velocity at any given time given the
%displacement along a given route
%   Input:
%       x: displacement (km)
%       route: a string for the route file 'speed_anna' or 'speed_elsa'

% Check the route and load appropriate data
if strcmp(route, 'speed_anna')
    scope = load('speed_anna.mat');
elseif strcmp(route, 'speed_elsa')
    scope = load('speed_elsa.mat');
else
    error("Route has to be either 'speed_anna' or 'speed_elsa'")
end

assert( x >= 0 && x <= scope.distance_km(length(scope.distance_km)));

v = spline(scope.distance_km, scope.speed_kmph, x);
end