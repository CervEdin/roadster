function E = total_consumption_trap(x, route, n)
% Approximates the total energy consumption for a given distance along
% a certain route using the functions 'velocity' and 'consumption'
%     Input:
%       x: Distance (km)
%       route: Route taken 'anna' or 'elsa'
%       n: Amount of partial intervals
%     Output:
%       E: Total energy consumption (Wh)

load(route);

x_points = linspace(0, x, n+1);

% T = h(1/2f(x_0)+f(x_1)+...+f(x_n-1)+1/2f(x_n))
y_points = consumption(velocity(x_points, route));
interval_size = x_points(2) - x_points(1);
weights=ones(size(x_points));
weights(1)=1/2;
weights(end)=1/2;

matlab_integral = integral(@(s) consumption(velocity(s, route)), 0, x);
%disp(I);

E=interval_size*weights*y_points';

end

% Total elkonsumtion: Du ska nu anv�nda b�da funktionerna velocity och
% consumption fr�n del 1 f�r att uppskatta elkonsumtionen f�r en given
% str�cka l�ngs en viss rutt. Den totala elkonsumtionen E(x) i wattimmar
% efter en tillryggalagd str�cka p� x km ges av E(x) =Zx 0 c(v(s))ds (2)
% d�r c(v) �r elkonsumtion per km (Wh/km) som funktion av hastighet v
% (km/h) och v(s) �r f�rv�ntad hastighet l�ngs med rutten.
% 
% Formulera som ovan n�gon av integrationsmetoderna fr�n kursen f�r att
% uppskatta integralen och skriv en matlab-funktion som returnerar
% elkonsumtion E(x) (Wh) f�r given tillryggalagd str�cka x (km).
% 
% Funktionen skall ha funktionshuvudet 
% function E = total_consumption(x, route, n) 
% Hur mycket energi g�r Anna och Elsa totalt av med l�ngs med
% sina respektive rutter? Unders�k hur m�nga delintervall n som kr�vs f�r
% att f� korrekt antal wattimmar i den numeriska integrationen.