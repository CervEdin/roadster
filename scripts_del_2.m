clear;

% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

subplot(2, 2, 1);
test_graph.x = linspace(0, 0.6);
test_graph.y = arrayfun( @(x) time_to_destination(x, anna.string, 2^16), test_graph.x) .* 60;
plot(test_graph.x, test_graph.y);
hold on

test_graph.y = arrayfun( @(x) time_to_destination(x, elsa.string, 2^16), test_graph.x) .* 60;
plot(test_graph.x, test_graph.y);
title("Time elapsed per kilometer")
xlabel("Distance (km)")
ylabel("Time (minutes)")

subplot(2, 2, 2);
test_graph.y = arrayfun( @(x) velocity(x, anna.string), test_graph.x);
plot(test_graph.x, test_graph.y); 
title("Speed at distance along the route")
xlabel("Distance (km)")
ylabel("Velocity (km/h)")
hold on

test_graph.y = arrayfun( @(x) velocity(x, elsa.string), test_graph.x);
plot(test_graph.x, test_graph.y);

subplot(2, 2, 3);
T = 0.05;
fx = @(x, T) time_to_destination(x, anna.string, 2.^16) - T;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
T = 0.04;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
T = 0.03;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
T = 0.02;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
T = 0.01;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
hold on
T = 0;
test_graph.y = arrayfun(@(x) fx(x, T), test_graph.x);
plot(test_graph.x, test_graph.y)
title("Plotting f(x) - T = 0 for T -> 0")
xlabel("Distance (km)")
ylabel("f(x) - T")

subplot(2, 2, 4);
title("1 / f'(x)")
fx = @(x, route) 1 ./ velocity(x, route);
fplot( @(x) fx(x, anna.string), [0 0.6] );
hold on
fplot( @(x) fx(x, elsa.string), [0 0.6] );
