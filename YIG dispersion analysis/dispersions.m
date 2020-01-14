close all
clear

y = 2.8+0; % MHz/Oe
fm = y*2290+0; % \gamma * 4*\pi*M_eff
H0 = 50+0; % Oe (0.1 mT)
fh = y*H0;

d1 = 0.130+0.0; % \mum
d2 = 0.260+0.0; % \mum

k = linspace(0, 10, 1000); % rad/\mum


f11 = sqrt(fh*(fh+fm*(1-(1-exp(-k*d1))./(k*d1))));
f12 = sqrt(fh*(fh+fm*(1-(1-exp(-k*d2))./(k*d2))));

f21 = sqrt(fh*(fh+fm*(1-exp(-k*d1))./(k*d1)));
f22 = sqrt(fh*(fh+fm*(1-exp(-k*d2))./(k*d2)));

f31 = sqrt((fh+fm/2)^2 - (fm/2)^2*exp(-2*k*d1));
f32 = sqrt((fh+fm/2)^2 - (fm/2)^2*exp(-2*k*d2));

fhTh = y * 300;

f11Th = sqrt(fhTh*(fhTh+fm*(1-(1-exp(-k*d1))./(k*d1))));
f12Th = sqrt(fhTh*(fhTh+fm*(1-(1-exp(-k*d2))./(k*d2))));

f21Th = sqrt(fhTh*(fhTh+fm*(1-exp(-k*d1))./(k*d1)));
f22Th = sqrt(fhTh*(fhTh+fm*(1-exp(-k*d2))./(k*d2)));

f31Th = sqrt((fhTh+fm/2)^2 - (fm/2)^2*exp(-2*k*d1));
f32Th = sqrt((fhTh+fm/2)^2 - (fm/2)^2*exp(-2*k*d2));

h1 = figure;
plot(k, f11)
hold on
plot(k, f12)
plot(k, f11Th)
plot(k, f12Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)')
legend({'d=130 nm, 5 mT', 'd=260 nm, 5 mT', 'd=130 nm, 30 mT', 'd=260 nm, 30 mT'}, 'FontSize', 12)
%title('FVMSW')

set(h1,'Units','Inches');
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h1,'filename','-dpdf','-r0')
set(gca,'FontSize',12)

h2 = figure;
plot(k, f21)
hold on
plot(k, f22)
plot(k, f21Th)
plot(k, f22Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)')
legend({'d=130 nm, 5 mT', 'd=260 nm, 5 mT', 'd=130 nm, 30 mT', 'd=260 nm, 30 mT'}, 'FontSize', 12)

%title('BVMSW')

set(h2,'Units','Inches');
pos = get(h2,'Position');
set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h2,'filename','-dpdf','-r0')
set(gca,'FontSize',12)


h3 = figure;
plot(k, f31)
hold on
plot(k, f32)
plot(k, f31Th)
plot(k, f32Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)', 'FontSize', 11)
legend({'d=130 nm, 5 mT', 'd=260 nm, 5 mT', 'd=130 nm, 30 mT', 'd=260 nm, 30 mT'}, 'FontSize', 12)

%title('MSSW')

set(h3,'Units','Inches');
pos = get(h3,'Position');
set(h3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h3,'filename','-dpdf','-r0')
set(gca,'FontSize',12)

h4 = figure;
plot(k, f11Th)
hold on
plot(k, f12Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)')
legend({'d=130 nm', 'd=260 nm'}, 'FontSize', 12)
%title('FVMSW')

set(h4,'Units','Inches');
pos = get(h4,'Position');
set(h4,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h4,'filename','-dpdf','-r0')
set(gca,'FontSize',12)

h5 = figure;
plot(k, f21Th)
hold on
plot(k, f22Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)')
legend({'d=130 nm', 'd=260 nm'}, 'FontSize', 12)
%title('FVMSW')

set(h5,'Units','Inches');
pos = get(h5,'Position');
set(h5,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h5,'filename','-dpdf','-r0')
set(gca,'FontSize',12)

h6 = figure;
plot(k, f31Th)
hold on
plot(k, f32Th)
xlabel('Wavevector k (rad/\mum)')
ylabel('Frequency (MHz)')
legend({'d=130 nm', 'd=260 nm'}, 'FontSize', 12)
%title('FVMSW')

set(h6,'Units','Inches');
pos = get(h6,'Position');
set(h6,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h6,'filename','-dpdf','-r0')
set(gca,'FontSize',12)



