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

x_min = -0.01;
x_max = max([time_to_destination(max(anna.distance_km), anna.string, 2^16) time_to_destination(max(elsa.distance_km), elsa.string, 2^16)]) + 0.01;
iterations = 50;

test_graph.x = linspace(x_min, x_max, iterations);
test_graph.y = arrayfun(@(x) distance(x, 'speed_anna'), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on

test_graph.x = linspace(x_min, x_max, iterations);
test_graph.y = arrayfun(@(x) distance(x, 'speed_elsa'), test_graph.x);
plot(test_graph.x, test_graph.y)

T = 0.5;
anna.Tdistance = distance(T, 'speed_anna');
elsa.Tdistance = distance(T, 'speed_elsa');

line([T T], [test_graph.y(1) test_graph.y(end)])
line([test_graph.x(1) test_graph.x(end)], [anna.Tdistance anna.Tdistance])
line([test_graph.x(1) test_graph.x(end)], [elsa.Tdistance elsa.Tdistance])
axis([test_graph.x(1) test_graph.x(end) 0 test_graph.y(end)])

xlabel('Time (h)')
ylabel('Distance (km)')
title('Distance over time')

% Test reach function and plot values
subplot(2, 1, 2)
x_min = -1;
x_max = max([total_consumption(max(anna.distance_km), anna.string, 2^16) total_consumption(max(elsa.distance_km), elsa.string, 2^16)]) + 1;

test_graph.x = linspace(x_min, x_max, iterations);
test_graph.y = arrayfun(@(x) reach(x, 'speed_anna'), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on

test_graph.x = linspace(x_min, x_max, iterations);
test_graph.y = arrayfun(@(x) reach(x, 'speed_elsa'), test_graph.x);
plot(test_graph.x, test_graph.y)

C = 10000;
anna.Creach = reach(C, 'speed_anna');
elsa.Creach = reach(C, 'speed_elsa');

line([C C], [test_graph.y(1) test_graph.y(end)])
line([x_min x_max], [anna.Creach anna.Creach])
line([x_min x_max], [elsa.Creach elsa.Creach])
axis([x_min x_max 0 70])

xlabel('Consumption (Wh)')
ylabel('Distance (km)')
title('Reach per charge')

%Reach, how far will Anna and Elsa travel in 30 min:
fprintf('Anna travels %.2f km in 30 min\n', anna.Tdistance);
fprintf('Elsa travels %.2f km in 30 min\n', elsa.Tdistance);

%Reach, how far will Anna and Elsa travel with a 10000 Wh charge:
fprintf('Anna reaches %.2f km with a 10000 Wh charge\n', anna.Creach);
fprintf('Elsa reaches %.2f km with a 10000 Wh charge\n', elsa.Creach);