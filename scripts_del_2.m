clear
clf

% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

% Test and plot the time_to_destination function
for n = 0 : 3
subplot(1, 2, 1);
x_min = 0;
x_max = anna.distance_km(end);
test_graph.x = linspace(x_min, x_max);
test_graph.y = arrayfun( @(x) time_to_destination(x, anna.string, 2^(n*4 + 2)), test_graph.x) .* 60;
plot(test_graph.x, test_graph.y);
hold on

% x_max = elsa.distance_km(end);
% test_graph.x = linspace(x_min, x_max);
% test_graph.y = arrayfun( @(x) time_to_destination(x, elsa.string, 2^(n*4)), test_graph.x) .* 60;
% plot(test_graph.x, test_graph.y);
end
title("Time elapsed per kilometer")
xlabel("Distance (km)")
ylabel("Time (minutes)")
legend('Anna, n = 4', 'Anna, n = 64', 'Anna, n = 1024', 'Anna, n = 16384')

% Test and plot the total_consumption function
for n = 0 : 3
subplot(1, 2, 2);
x_min = 0;
x_max = anna.distance_km(end);
test_graph.x = linspace(x_min, x_max);
test_graph.y = arrayfun( @(x) total_consumption(x, anna.string, 2^(n*4 + 2)), test_graph.x);
plot(test_graph.x, test_graph.y);
hold on
% 
% x_max = elsa.distance_km(end);
% test_graph.x = linspace(x_min, x_max);
% test_graph.y = arrayfun( @(x) total_consumption(x, elsa.string, 2^16), test_graph.x);
% plot(test_graph.x, test_graph.y);
end
title("Watts consumed per kilometer")
xlabel("Distance (km)")
ylabel("Energy consumed (Wh)")
legend('Anna, n = 4', 'Anna, n = 64', 'Anna, n = 1024', 'Anna, n = 16384')