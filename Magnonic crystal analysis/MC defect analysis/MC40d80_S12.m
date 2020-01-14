close all
clear

F = dir('*.txt');

xdata = zeros(512, length(F));
ydata1 = xdata;
ydata2 = xdata;

for k = 1:length(F)  
   read = dlmread(F(k).name);
  
   xdata(:,k) = read(:,1);
   ydata1(:,k) = read(:,6);
   ydata2(:,k) = read(:,2);
   
   figure
   plot(xdata(:,k), ydata1(:,k))
   xlabel('Frequency (GHz)')
   ylabel('Re(permeability)')
   title(F(k).name)
   
   figure
   plot(xdata(:,k), ydata2(:,k))
   xlabel('Frequency (GHz)')
   ylabel('Amplitude (arb. units)')
   title(F(k).name)
   
end

% Band gap width and central frequency extraction

h1 = figure;
hold on
box on
plot(xdata(:, 1), ydata1(:, 1))
xlabel('Frequency (GHz)')
ylabel('Re(S_{12}))')
xlim([0.7, 1.8])
set(h1,'Units','Inches');
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h1,'filename','-dpdf','-r0')
set(gca,'FontSize',13.5)

h2 = figure;
hold on
box on
plot(xdata(:, 6), ydata1(:, 6))
xlabel('Frequency (GHz)')
ylabel('Re(S_{12}))')
xlim([1, 1.8])
set(h2,'Units','Inches');
pos = get(h2,'Position');
set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h2,'filename','-dpdf','-r0')
set(gca,'FontSize',13.5)




%%%%
fields = 3:8;

center1 = [1.0418, 1.134, 1.219, 1.2925, 1.3725, 1.4475];
center2 = [1.1995, 1.2745, 1.347, 1.425, 1.4885, 1.556];
width1 = [0.0864, 0.082, 0.08, 0.073, 0.065, 0.065];
width2 = [0.083, 0.075, 0.07, 0.062, 0.061, 0.058];

figure
scatter(fields, center1, 'd', 'b')
hold on
scatter(fields, center2, 'o', 'r')
xlabel('Magnetic field (mT)')
ylabel('Bandgap center (GHz)')
legend('First bandgap', 'Second bandgap')


figure
scatter(fields, width1*1000, 'd', 'b')
hold on
scatter(fields, width2*1000, 'o', 'r')
xlabel('Magnetic field (mT)')
ylabel('Band gap size (MHz)')
legend('First bandgap', 'Second bandgap')

