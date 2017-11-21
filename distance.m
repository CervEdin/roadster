function x = distance(T, route)
%DISTANCE Summary of this function goes here
%   Detailed explanation goes here

end

% Sträcka: Antag nu att föraren vill veta hur långt längs rutten hon
% förväntas ommitpåenvisstid. Utgå från ekvationen för ankomsttid och
% formulera den icke-linjäraekvation vars rot ger förväntad tillryggalagd
% sträcka efter T timmar. Formulera sedan Newtons metod för att lösa
% ekvationen. Fundera på vad som skulle vara en bra startgissning för att
% hitta roten. Skriv en matlab-funktion där du implementerar Newtons metod
% inklusive startgissning. Funktionen skall ha funktionshuvudet function x
% = distance(T, route) Hur långt kommer Anna och Elsa längs sina respektive
% rutter på 30 min? Tips: Använd funktionerna time_to_destination och
% velocity.