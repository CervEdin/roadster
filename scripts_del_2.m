% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

test_graph.x = linspace(0, max(anna.distance_km));
test_graph.y = arrayfun( @(x) time_to_destination_simpson(x, anna.string, 256), test_graph.x);
plot(test_graph.x, test_graph.y);   