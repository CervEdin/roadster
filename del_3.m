clear;

%Sträcka, hur långt kommer Anna och Elsa längs sina rutter på 30 min:
T = 0.3;
fprintf('Anna kommer %.2f km in på 30 min\n', distance_root(T, 'speed_anna'));
fprintf('Elsa kommer %.2f km in på 30 min\n', distance_root(T, 'speed_elsa'));

%Sträcka, hur långt kommer Anna och Elsa längs sina rutter med 10000 Wh:
C = 10000;
fprintf('Anna kommer %.2f km in med en laddning på 10000 Wh\n', reach(C, 'speed_anna'));
fprintf('Elsa kommer %.2f km in med en laddning på 10000 Wh\n', reach(C, 'speed_elsa'));