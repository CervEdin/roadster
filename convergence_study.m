%konvergensstudie, y-led är error och x-led är antal intervall
clear;

n_intervals=2.^(3:10);
distance_trap=zeros(size(n_intervals));
distance_simpson=zeros(size(n_intervals));
total_trap=zeros(size(n_intervals));
total_simpson=zeros(size(n_intervals));
route = 'speed_elsa';

% Vad står T för?
T = 60;

for j=1:length(n_intervals)
    distance_trap(j) = time_to_destination_trap(T, route, n_intervals(j));
    distance_simpson(j) = time_to_destination_simpson(T, route, n_intervals(j));
    total_trap(j) = total_consumption_trap(T, route, n_intervals(j));
    total_simpson(j) = total_consumption_simpson(T, route, n_intervals(j));
end
h=T./n_intervals;

%Error with tredjedelsregeln
error_total_trap=(total_trap(2:end)-total_trap(1:end-1))/3;
error_distance_trap=(distance_trap(2:end)-distance_trap(1:end-1))/3;


%Error with femtondelsregeln
error_total_simpson=(total_simpson(2:end)-total_simpson(1:end-1))/15;
error_distance_simpson=(distance_simpson(2:end)-distance_simpson(1:end-1))/15;

%Kapa h så den blir lika lång som error vektorerna
% Vad är h? :)
h=h(2:end);

subplot(2,2,1); plot(h, error_distance_trap,    'o'); xlabel('h'); ylabel('error'); title('Time to distance - Trap');
subplot(2,2,2); plot(h, error_distance_simpson, 'x'); xlabel('h'); ylabel('error'); title('Time to distance - Simpson');
subplot(2,2,3); plot(h, error_total_trap,       'o'); xlabel('h'); ylabel('error'); title('Total consumption - Trap');
subplot(2,2,4); plot(h, error_total_simpson,    'x'); xlabel('h'); ylabel('error'); title('Total consumption - Simpson');

%felet i trapets - ch^2
%log E = log ch^2 = log c + log h^2 = log c + 2*log h
%felet i simpson - ch^4
%log E = log ch^4 = log c + log h^4 = log c + 4*log h