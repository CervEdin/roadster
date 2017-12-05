function T = time_to_destination_trap(x, route, n)
% Calculate the time it takes to travel to a given distance using the
% function 'velocity'
%   Input:
%     x: Distance (km)
%     route: The route taken, anna or elsa
%     n: Partialintervals of the integration method
%   Output:
%     T: The time taken (h)

load(route);

x_points = linspace(0, x, n+1);

% T = h(1/2f(x_0)+f(x_1)+...+f(x_n-1)+1/2f(x_n))

% Varf�r .^(-1) ?
y_points = velocity(x_points, route).^(-1);
interval_size = x_points(2) - x_points(1);
weights=ones(size(x_points));
weights(1)=1/2;
weights(end)=1/2;

% F�r att verifiera resultat?
I = integral(@(s) velocity(s, route).^(-1), 0, x);
%disp(I);

% Varf�r transponat?
T=interval_size*weights*y_points';

end

%  Ankomsttid: 
%  Du ska nu anv�nda funktionen velocity fr�n del 1 f�r att uppskatta hur l�ng tid det tar att f�rdas en viss str�cka l�ngs en viss rutt. 
% Tiden T(x) (h) det tar att f�rdas x km l�ngs med rutten ges av T(x) =Zx 0 1 v(s) ds. 
% (1) 3 (5)
% Du kan anta att v(s) �r positiv. 
% Formulera n�gon av integrationsmetoderna fr�n kursen f�r att uppskatta integralen och skriv en matlab-funktion som returnerar tid T(x) (h) f�r given tillryggalagd str�cka x (km). 
% Funktionen skall ha funktionshuvudet
% function T = time_to_destination(x, route, n)
% d�r route �r som tidigare och n �r antalet delintervall i integrationsmetoden. 
% Notera att du skall g�ra en egen implemention av integrationsmetoden du valt, utan anrop tex till matlabs integral. 
% (Men du kan anv�nda tex integral f�r att veri?era dina resultat.) 
% 
% Hur l�ng tid tar det f�r Anna och Elsa att f�rdas hela str�ckan l�ngs sina respektive rutter? 
% Unders�k hur m�nga delintervall n som kr�vs f�r att f� korrekt antal minuter i den numeriska integrationen.