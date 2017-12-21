clear
clf

% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

% Test distance function and plot values
subplot(2, 1, 1)
test_graph.x = linspace(-0.01, time_to_destination(max(anna.distance_km), anna.string, 2^16) + 0.01, 10);
test_graph.y = arrayfun(@(x) distance(x, 'speed_anna'), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
test_graph.x = linspace(-0.01, time_to_destination(max(elsa.distance_km), elsa.string, 2^16) + 0.01, 10);
test_graph.y = arrayfun(@(x) distance(x, 'speed_elsa'), test_graph.x);
plot(test_graph.x, test_graph.y)
xlabel('Time (h)')
ylabel('Distance (km)')
title('Distance over time')

% Test reach function and plot values
subplot(2, 1, 2)
test_graph.x = linspace(-1, total_consumption(max(anna.distance_km), anna.string, 2^16) + 1, 10);
test_graph.y = arrayfun(@(x) reach(x, 'speed_anna'), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
test_graph.x = linspace(-1, total_consumption(max(elsa.distance_km), elsa.string, 2^16) + 1, 10);
test_graph.y = arrayfun(@(x) reach(x, 'speed_elsa'), test_graph.x);
plot(test_graph.x, test_graph.y)
line([10000 10000], [test_graph.y(1) test_graph.y(end)])
xlabel('Consumption (Wh)')
ylabel('Distance (km)')
title('Reach per charge')