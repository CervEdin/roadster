function v = velocity(x, route)
%VELOCITY  Approximate the velocity at any given time given the
%distance along a given route
%   Input:
%       x: distance (km)
%       route: a string for the route file 'speed_anna' or 'speed_elsa'

% Check the route and load appropriate data
if ~strcmp(route, 'speed_anna') && ~strcmp(route, 'speed_elsa')
    error('Route has to be either ''speed_anna'' or ''speed_elsa''');
end

scope = load(route, '-mat');

assert( min(x) >= 0 && max(x) <= scope.distance_km(end));

v = spline(scope.distance_km, scope.speed_kmph, x);
end