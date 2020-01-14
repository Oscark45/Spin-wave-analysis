close all
clear

y = 2.8*1000*1+0;
fm = y*1750*1+0;
H0 = 1845*1+0;
fh = y*H0;

d1 = 130*0+1.3;
d2 = 260*0+2.6;

k = linspace(0, 0.4, 1000);


f = sqrt((fh+fm/2)^2 - (fm/2)^2*exp(-2*k*d1));

figure
plot(f,k)
xlabel('Frequency (GHz)')
ylabel('Wave vector (rad/\mum)')