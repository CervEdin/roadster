% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

test_graph.x = linspace(0, 2, 1000);
test_graph.y = arrayfun( @(x) time_to_destination_simpson(x, anna.string, 2^16), test_graph.x) .* 60;
plot(test_graph.x, test_graph.y); 
xlabel("Distance (km)")
ylabel("Time (minutes)")
hold on

test_graph.x = linspace(0, 2, 1000);
test_graph.y = arrayfun( @(x) time_to_destination_simpson(x, elsa.string, 2^16), test_graph.x) .* 60;
plot(test_graph.x, test_graph.y);
title("Time elapsed per kilometer")