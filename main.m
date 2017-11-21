clear;
clf
load roadster.mat

anna = load('speed_anna.mat');
elsa = load('speed_elsa.mat');

% Roadster battery capacity (Wh)
bat_cap = 55000;

interval = 100;

graphs.consumption.x_speed = linspace(speed_kmph(1), speed_kmph(end), interval);
graphs.consumption.y_consumption = arrayfun(@(x) consumption(x), graphs.consumption.x_speed);

graphs.range.x_speed = graphs.consumption.x_speed;
graphs.range.y_range = arrayfun(@(x) bat_cap/x, graphs.consumption.y_consumption);

graphs.anna.x_distance = linspace(anna.distance_km(1), anna.distance_km(end), interval);
graphs.anna.y_speed = arrayfun(@(x) velocity(x, 'speed_anna'), graphs.anna.x_distance);

subplot(2, 2, 1) ; plot(graphs.consumption.x_speed, graphs.consumption.y_consumption, '-') ; title("Consumption per km/h");
subplot(2, 2, 3) ; plot(graphs.range.x_speed, graphs.range.y_range, '-') ; title("Range per km/h");
subplot(2, 2, 2) ; plot(graphs.anna.x_distance, graphs.anna.y_speed, '-') ; title("Annas velocity");