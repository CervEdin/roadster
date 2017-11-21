% Clear workspace and any graphs
clear;
clf

% Load data from disk
load roadster.mat
anna = load('speed_anna.mat');
elsa = load('speed_elsa.mat');

% Roadster battery capacity (Wh)
bat_cap = 55000;

% Interval for x-values on graphs
interval = 100;

% Graph displaying consumption of electricity in Watthours per kilometer
% x-values: Speed (km/h), linear interpolation from the beginning of to the
% end of speed data
graphs.consumption.x_speed = linspace(speed_kmph(1), speed_kmph(end), interval);
% y-values: Consumption (Wh/km), calculated by the consumption function
graphs.consumption.y_consumption = arrayfun(@(x) consumption(x), graphs.consumption.x_speed);
% Plot the graph
subplot(2, 2, 1) ; plot(graphs.consumption.x_speed, graphs.consumption.y_consumption, '-') ; title("Consumption per km/h");

% Graph displaying the range (km) of a Tesla Roadster with a battery capacity
% of 55 kWh at a given speed
% x-values: Speed, same as consumption graph
graphs.range.x_speed = graphs.consumption.x_speed;
% y-values: Range of a 55 kWh battery at a given speed
graphs.range.y_range = arrayfun(@(x) bat_cap/x, graphs.consumption.y_consumption);
% Plot the graph
subplot(2, 2, 3) ; plot(graphs.range.x_speed, graphs.range.y_range, '-') ; title("Range per km/h");

% Graph displaying the speed of Anna (km/h) per displacement(km)
% x-values: Displacement (km), linear interpolation between start and end
%of data
graphs.anna.x_distance = linspace(anna.distance_km(1), anna.distance_km(end), interval);
% y-values: Speed (km/h) of Anna at a given displacement along her route
% calculated by the velocity function
graphs.anna.y_speed = arrayfun(@(x) velocity(x, 'speed_anna'), graphs.anna.x_distance);
% Plot the graph
subplot(2, 2, 2) ; plot(graphs.anna.x_distance, graphs.anna.y_speed, '-') ; title("Annas velocity");