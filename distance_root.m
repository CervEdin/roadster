function x = distance_root( T, route )
%DISTANCE_ROOT Summary of this function goes here
%   Detailed explanation goes here

load(route);

%börja med att beräkna tiden för hela sträckan T(end)
%if T > T(end)
%   x = distance_km(end)

%hitta startgissning x0
%lös f(x) = 0 med Newton-Raphson
%använd f o fprim
f = @(x) time_to_destination(x, route, 1024) - T;
fprime = @(x) 1/velocity(x, route); 

%för att hitta startgissning:
%1. beräkna medelhasitheten V0
%2. X0 = V0*T

%xn+1 = xn - (f/fprime)

end

