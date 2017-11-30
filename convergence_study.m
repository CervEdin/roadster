%konvergensstudie, y-led är error och x-led är antal intervall
clear;

n_intervals=2.^(3:8);
distance=zeros(size(n_intervals));
T = 60;

for j=1:length(n_intervals)
    distance(j) = time_to_destination(T, n_intervals(j));
end
h=T./n_intervals;

%Error with tredjedelsregeln
error=(distance(2:end)-distance(1:end-1))/3;
%Kapa h så den blir lika lång som error vektorn
h=h(2:end);
plot(log(h),log(error), 'o');
xlabel('log(h)');
ylabel('log(eror)');
%felet i trapets - ch^2
%log E = log ch^2 = log c + log h^2 = log c + 2logh