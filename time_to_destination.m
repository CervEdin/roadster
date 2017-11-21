function T = time_to_destination(x, route, n)
% Calculate the time it takes to travel to a given distance using the
% function 'velocity'
%   Input:
%     x: Distance (km)
%     route: The route taken, anna or elsa
%     n: Partialintervals of the integration method
%   Output:
%     T: The time taken (h)

distance = x;

time_taken = integral(@(s) velocity(s, route).^(-1), 0, distance);

T = time_taken;
end

%  Ankomsttid: 
%  Du ska nu använda funktionen velocity från del 1 för att uppskatta hur lång tid det tar att färdas en viss sträcka längs en viss rutt. 
% Tiden T(x) (h) det tar att färdas x km längs med rutten ges av T(x) =Zx 0 1 v(s) ds. 
% (1) 3 (5)
% Du kan anta att v(s) är positiv. 
% Formulera någon av integrationsmetoderna från kursen för att uppskatta integralen och skriv en matlab-funktion som returnerar tid T(x) (h) för given tillryggalagd sträcka x (km). 
% Funktionen skall ha funktionshuvudet
% function T = time_to_destination(x, route, n)
% där route är som tidigare och n är antalet delintervall i integrationsmetoden. 
% Notera att du skall göra en egen implemention av integrationsmetoden du valt, utan anrop tex till matlabs integral. 
% (Men du kan använda tex integral för att veri?era dina resultat.) 
% 
% Hur lång tid tar det för Anna och Elsa att färdas hela sträckan längs sina respektive rutter? 
% Undersök hur många delintervall n som krävs för att få korrekt antal minuter i den numeriska integrationen.