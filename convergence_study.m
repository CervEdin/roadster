clear;

n_intervals=2.^(12:24);
simpson=zeros(size(n_intervals));
route = 'speed_elsa';

% Input to time_to_destination function
distance = 60;

for j=1:length(n_intervals)
    simpson(j) = time_to_destination_simpson(distance, route, n_intervals(j));
end
h=distance./n_intervals;

%abs. error with exact matlab integral
matlab_integral = integral(@(s) velocity(s, route).^(-1), 0, distance);
error_simpson=abs(1-(simpson(1:end)/matlab_integral));

%error with femtondelsregeln
error = abs(simpson(2:end)-simpson(1:end-1))/15;
%error in simpson - ch^4
%log E = log ch^4 = log c + log h^4 = log c + 4*log h
h = h(2:end);
figure(1);clf
loglog(h, error, 'x-r', h, error_simpson(2:end), 'o-b');
hold on;
loglog(h,h.^4,'.--');
xlabel('h'); 
ylabel('error');
legend('Approximate error', 'Absolute error','h^4','Location','Best')
set(gca,'FontSize',14)
axis([min(h) max(h) 10^(-24) 10])