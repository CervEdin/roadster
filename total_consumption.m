function E = total_consumption(x, route, n)
% Approximates the total energy consumption for a given displacement along
% a certain route using the functions 'velocity' and 'consumption'
%     Input:
%       x: Displacement (km)
%       route: Route taken 'anna' or 'elsa'
%       n: Amount of partial intervals
%     Output:
%       E: Total energy consumption (Wh)

end

% Total elkonsumtion: Du ska nu använda båda funktionerna velocity och
% consumption från del 1 för att uppskatta elkonsumtionen för en given
% sträcka längs en viss rutt. Den totala elkonsumtionen E(x) i wattimmar
% efter en tillryggalagd sträcka på x km ges av E(x) =Zx 0 c(v(s))ds (2)
% där c(v) är elkonsumtion per km (Wh/km) som funktion av hastighet v
% (km/h) och v(s) är förväntad hastighet längs med rutten.
% 
% Formulera som ovan någon av integrationsmetoderna från kursen för att
% uppskatta integralen och skriv en matlab-funktion som returnerar
% elkonsumtion E(x) (Wh) för given tillryggalagd sträcka x (km).
% 
% Funktionen skall ha funktionshuvudet 
% function E = total_consumption(x, route, n) 
% Hur mycket energi gör Anna och Elsa totalt av med längs med
% sina respektive rutter? Undersök hur många delintervall n som krävs för
% att få korrekt antal wattimmar i den numeriska integrationen.