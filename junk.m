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