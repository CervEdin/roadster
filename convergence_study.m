%konvergensstudie, y-led är error och x-led är antal intervall
clear;

n_intervals=2.^(2:12);
simpson=zeros(size(n_intervals));
simpson_2h=zeros(size(n_intervals));
route = 'speed_elsa';

% Input to time_to_destination function
distance = 60;

for j=1:length(n_intervals)
    simpson(j) = time_to_destination_simpson(distance, route, n_intervals(j));
    %simpson_2h(j) = time_to_destination_simpson(distance, route, n_intervals(j)/2);
end
h=distance./n_intervals;

%abs. error with exact matlab integral
matlab_integral = integral(@(s) velocity(s, route).^(-1), 0, distance);
error_simpson=abs(matlab_integral-simpson(1:end));
%error_simpson_2h=abs(matlab_integral-simpson_2h(1:end));
%error in simpson - ch^4
%log E = log ch^4 = log c + log h^4 = log c + 4*log h

figure(1);clf
%loglog(h, error_simpson, 'x-r', h, error_simpson_2h, 'o-b');
loglog(h, error_simpson, 'x-r');
hold on
loglog(h,h.^4,'--');
xlabel('h'); 
ylabel('error');
legend('Simpson','h^4','Location','Best')
set(gca,'FontSize',14)
axis([min(h) max(h) min(error_simpson) 10])