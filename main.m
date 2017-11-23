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
consumption_graph.x_speed = linspace(speed_kmph(1), speed_kmph(end), interval);
% y-values: Consumption (Wh/km), calculated by the consumption function
consumption_graph.y_consumption = consumption(consumption_graph.x_speed);

% Finds local minimum, record y-value at nth x-value
[consumption_graph.min_y, consumption_graph.min_x] = min(consumption_graph.y_consumption);
% Convert nth x-value to that corresponding x-value
consumption_graph.min_x = consumption_graph.x_speed(consumption_graph.min_x);

% Plot the graph
subplot(2, 2, 1) ; plot(consumption_graph.x_speed, consumption_graph.y_consumption, '-', consumption_graph.min_x, consumption_graph.min_y, 'x'); 
title('Consumption per km/h'); xlabel('speed (km/h)'); ylabel('consumption (Wh/km)');

% Graph displaying the range (km) of a Tesla Roadster with a battery capacity
% of 55 kWh at a given speed

% x-values: Speed, same as consumption graph
range.x_speed = consumption_graph.x_speed;
% y-values: Range of a 55 kWh battery at a given speed
range.y_range = bat_cap * consumption_graph.y_consumption.^(-1);

% Plot the graph
subplot(2, 2, 3) ; plot(range.x_speed, range.y_range, '-') ; 
title('Range per km/h'); xlabel('speed (km/h)'); ylabel('range (km)');

% Graph displaying the speed of Anna (km/h) per distance(km)

% x-values: Distance (km), linear interpolation between start and end
%of data
anna.x_distance = linspace(anna.distance_km(1), anna.distance_km(end), interval);
% y-values: Speed (km/h) of Anna at a given distance along her route
% calculated by the velocity function
anna.y_speed = velocity(anna.x_distance, 'speed_anna');

% Plot the graph
subplot(2, 2, 2) ; plot(anna.x_distance, anna.y_speed, '-') ; 
title('Annas velocity'); xlabel('distance (km)'); ylabel('speed (km/h)');

% Graph displaying the speed of Elsa (km/h) per distance(km)

% x-values: Distance (km), linear interpolation between start and end
%of data
elsa.x_distance = linspace(elsa.distance_km(1), elsa.distance_km(end), interval);
% y-values: Speed (km/h) of Elsa at a given distance along her route
% calculated by the velocity function
elsa.y_speed = velocity(elsa.x_distance, 'speed_elsa');

% Plot the graph
subplot(2, 2, 4) ; plot(elsa.x_distance, elsa.y_speed, '-') ; 
title('Elsas velocity');  xlabel('distance (km)'); ylabel('speed (km/h)');

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