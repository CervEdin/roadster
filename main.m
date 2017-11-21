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

% Graph displaying the speed of Anna (km/h) per distance(km)
% x-values: Distance (km), linear interpolation between start and end
%of data
graphs.anna.x_distance = linspace(anna.distance_km(1), anna.distance_km(end), interval);
% y-values: Speed (km/h) of Anna at a given distance along her route
% calculated by the velocity function
graphs.anna.y_speed = arrayfun(@(x) velocity(x, 'speed_anna'), graphs.anna.x_distance);
% Plot the graph
subplot(2, 2, 2) ; plot(graphs.anna.x_distance, graphs.anna.y_speed, '-') ; title("Annas velocity");

% Graph displaying the speed of Elsa (km/h) per distance(km)
% x-values: Distance (km), linear interpolation between start and end
%of data
graphs.elsa.x_distance = linspace(elsa.distance_km(1), elsa.distance_km(end), interval);
% y-values: Speed (km/h) of Elsa at a given distance along her route
% calculated by the velocity function
graphs.elsa.y_speed = arrayfun(@(x) velocity(x, 'speed_elsa'), graphs.elsa.x_distance);
% Plot the graph
subplot(2, 2, 4) ; plot(graphs.elsa.x_distance, graphs.elsa.y_speed, '-') ; title("Elsas velocity");

% Konvergensstudie: För åtminstone en av de två integralerna (1) och (2)
% skall du nu göra en empirisk undersökning av noggrannhetsordningen för
% din metod. Räkna ut integrationsfelet för en serie beräkningar där
% antalet delintervall dubbleras successivt, dvs för en serie
% n,2n,4n,8n,16n,.... Om du inte känner till det exakta integral värdet kan
% du jämföra med integralvärdet med halverad steglängd.
% 
% Alltså, för beräkningen med n delintervall jämför du med värdet med 2n
% delintervall, etc. Plotta integrationsfelet som funktion av antalet
% delintervall n eller steglängd h = (x?0)/n.
% 
% Här är det vanligtvis lämpligt att plotta i log-skala, det kan du göra
% genom att istället för plot användakommandot loglog somger log-skala både
% på x- och y-axeln. Plotta också hjälplinjer som visar vilken lutning på
% kurvan som svarar mot olika noggrannhetsordningar. Tex, om du använder en
% andra ordningens metod plottar du en hjälplinje som visar O(1/n2)- eller
% O(h2)-beteende. Hitta en linje som stämmer överens med dina resultat.
% Stämmer den empiriskt bestämda noggrannhetsordningen med teorin för den
% integrationsmetod du använt? Om inte, varför?