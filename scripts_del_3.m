clear;

% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
anna.string = 'speed_anna';
elsa = load('speed_elsa.mat');
elsa.string = 'speed_elsa';

%test_graph.x = linspace(0, max(anna.distance_km));
%test_graph.y = arrayfun(@(x) time_to_destination(x, 'speed_anna', 2^16), test_graph.x);
%plot(test_graph.x, test_graph.y)
%xlabel('distance (km)')
%ylabel('time (hours)')
%title('Time to destination Anna')

% test_graph.x = linspace(0, 1);
% test_graph.y = arrayfun(@(x) time_to_destination(x, 'speed_elsa', 2^16), test_graph.x);
% plot(test_graph.x, test_graph.y)
% xlabel('distance (km)')
% ylabel('time (hours)')
% title('Time to destination Elsa')

% test_graph.x = linspace(0.05, .5);
% test_graph.y = arrayfun(@(x) distance_root(x, 'speed_anna'), test_graph.x);
% plot(test_graph.x, test_graph.y)
% xlabel('Time (h)')
% ylabel('Distance (km)')
% title('Elsa distance over time')

test_graph.x = linspace(0, max(anna.distance_km));
test_graph.y = arrayfun(@(x) total_consumption(x, anna.string, 2^16), test_graph.x);
plot(test_graph.x, test_graph.y);
hold on
test_graph.x = linspace(0, max(elsa.distance_km));
test_graph.y = arrayfun(@(x) total_consumption(x, elsa.string, 2^16), test_graph.x);
plot(test_graph.x, test_graph.y);
%test_graph.x = linspace(0, 