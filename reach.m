function x = reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here

load(route);

%börja med att beräkna tiden för hela sträckan T(end)
%if T > T(end)
%   x = distance_km(end)

%hitta startgissning x0
%för att hitta startgissning:
%1. beräkna medelhastigheten V0
%2. X0 = V0*T
x_prev = 1;
x_curr = 100;
tol = 5 * 10^-4;
%lös f(x) = 0 med Newton-Raphson
%använd f o fprim
%f = @(x) time_to_destination_simpson(x, route, 16) - C;
%fprime = @(x) 1/velocity(x, route); 

while abs(x_curr-x_prev) > tol
    x_curr = x_prev - (f(x_prev)/fprime(x_prev));
    x_prev = x_curr;
end
x = x_prev;
end

% Räckvidd: Antag nu att batteriet är laddat till C Wh. Formulera den
% ickelinjäraekvationvarsrotgerbilensräckvidd.FormulerasedanNewtonsmetod
% för att lösa ekvationen. Fundera på vad som skulle vara en bra
% startgissning för att hitta roten. Skriv en matlab-funktion där du
% implementerar
% Newtonsmetodinklusivestartgissning.Funktionenskallhafunktionshuvudet
% function x = reach(C, route) Hur långt skulle Anna och Elsa komma på sina
% respektive rutter med en batteriladdning på C = 10000 Wh? Tips: Använd
% funktionerna total_consumption, velocity och consumption