%Konvergensstudien fr�n f�rel�sning f9
% �r det h�r ett exempel Emanuel visade?
clear;
a = 0;
b = 60;
route = 'speed_elsa';
Iref = integral(@(s) velocity(s, route).^(-1), a, b);

fprintf('%6s %10s %10s %15s %15s\n', 'n', 'Iref-Th', 'Iref-Sh', '(Iref-T2h)/(Iref-Th)', '(Iref-S2h)/(Iref-Sh)')
n=4;
for i=1:10
  Th  = time_to_destination_trap(b, route, n);
  T2h = time_to_destination_trap(b, route, n/2);
  Sh  = time_to_destination(b, route, n);
  S2h = time_to_destination(b, route, n/2);
  fprintf('%6i %10.2e %10.2e %15.2f %15.2f\n', n, Iref-Th, Iref-Sh, (Iref-T2h)/(Iref-Th), (Iref-S2h)/(Iref-Sh))
  ET(i) = abs(Iref-S2h);
  ES(i) = abs(Iref-Sh); 
  ER(i) = abs(Sh-S2h)/15;
  h(i) = (b-a)/n;
  n = 2*n;
end

figure(1);clf
loglog(h,ER,'o-b')%,h,ES,'x-r')
hold on
loglog(h,h.^2,'--',h,h.^4,'-.')
legend('Simpson(2h)','Simpson','h^2','h^4','Location','Best')
xlabel('h')
ylabel('Fel')
set(gca,'FontSize',14)
axis([min(h) max(h) min(ES) 10])