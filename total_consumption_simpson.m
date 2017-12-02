function E  = total_consumption_simpson( x, route, n )
% Approximates the total energy consumption for a given distance along
% a certain route using the functions 'velocity' and 'consumption'
%     Input:
%       x: Distance (km)
%       route: Route taken 'anna' or 'elsa'
%       n: Amount of partial intervals
%     Output:
%       E: Total energy consumption (Wh)

load(route);

t = linspace(0, x, n+1);

% S = h/3(f(x_0)+4f(x_1)+2f(x_2)+...+4f(x_n-1)+f(x_n))
fx = consumption(velocity(t, route));
h = (t(2) - t(1))/3;

weights=ones(size(t))*2;
weights(2:2:end) = 4;
weights(1)=1;
weights(end)=1;


I = integral(@(s) consumption(velocity(s, route)), 0, x);
%disp(I);

E=h*weights*fx';

end

