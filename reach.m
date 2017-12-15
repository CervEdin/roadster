function x = reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here

load(route);

%b�rja med att ber�kna tiden f�r hela str�ckan T(end)
%if T > T(end)
%   x = distance_km(end)

%hitta startgissning x0
%f�r att hitta startgissning:
%1. ber�kna medelhastigheten V0
%2. X0 = V0*T
x_prev = 1;
x_curr = 100;
tol = 5 * 10^-4;
%l�s f(x) = 0 med Newton-Raphson
%anv�nd f o fprim
%f = @(x) time_to_destination_simpson(x, route, 16) - C;
%fprime = @(x) 1/velocity(x, route); 

while abs(x_curr-x_prev) > tol
    x_curr = x_prev - (f(x_prev)/fprime(x_prev));
    x_prev = x_curr;
end
x = x_prev;
end

% R�ckvidd: Antag nu att batteriet �r laddat till C Wh. Formulera den
% ickelinj�raekvationvarsrotgerbilensr�ckvidd.FormulerasedanNewtonsmetod
% f�r att l�sa ekvationen. Fundera p� vad som skulle vara en bra
% startgissning f�r att hitta roten. Skriv en matlab-funktion d�r du
% implementerar
% Newtonsmetodinklusivestartgissning.Funktionenskallhafunktionshuvudet
% function x = reach(C, route) Hur l�ngt skulle Anna och Elsa komma p� sina
% respektive rutter med en batteriladdning p� C = 10000 Wh? Tips: Anv�nd
% funktionerna total_consumption, velocity och consumption