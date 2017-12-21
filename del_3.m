clear;

%Str�cka, hur l�ngt kommer Anna och Elsa l�ngs sina rutter p� 30 min:
T = 0.3;
fprintf('Anna kommer %.2f km in p� 30 min\n', distance(T, 'speed_anna'));
fprintf('Elsa kommer %.2f km in p� 30 min\n', distance(T, 'speed_elsa'));

%Str�cka, hur l�ngt kommer Anna och Elsa l�ngs sina rutter med 10000 Wh:
C = 10000;
fprintf('Anna kommer %.2f km in med en laddning p� 10000 Wh\n', reach(C, 'speed_anna'));
fprintf('Elsa kommer %.2f km in med en laddning p� 10000 Wh\n', reach(C, 'speed_elsa'));