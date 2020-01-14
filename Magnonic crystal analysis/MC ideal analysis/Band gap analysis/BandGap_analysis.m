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

fields = 3:8;

center1 = [1.096, 1.179, 1.261, 1.3405, 1.414, 1.486];
center2 = [1.258, 1.337, 1.409, 1.4775, 1.546, 1.6125];
width1 = [0.078, 0.074, 0.07, 0.067, 0.06, 0.056];
width2 = [0.07, 0.066, 0.064, 0.059, 0.056, 0.049];

h1 = figure;
scatter(fields, center1, 'd', 'b')
hold on
box on
scatter(fields, center2, 'o', 'r')
xlabel('Magnetic field (mT)')
ylabel('Band gap center (GHz)')
xlim([2.5, 8.5])
legend('1st band gap', '2nd band gap')
set(h1,'Units','Inches');
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h1,'filename','-dpdf','-r0')
set(gca,'FontSize',11.5)


h2 = figure;
scatter(fields, width1*1000, 'd', 'b')
hold on
box on
scatter(fields, width2*1000, 'o', 'r')
xlabel('Magnetic field (mT)')
xlim([2.5, 8.5])
%xticks([3 4 5 6 7 8])
%xticklabels({'3','4','5','6','7','8'})
%xlim([0,9])
ylabel('Band gap size (MHz)')
legend('1st band gap', '2nd band gap')
set(h2,'Units','Inches');
pos = get(h2,'Position');
set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h2,'filename','-dpdf','-r0')
set(gca,'FontSize',11.5)

figure
plot(xdata(:,5), ydata1(:,5))
xlabel('Frequency (GHz)')
ylabel('Amplitude (arb.)')
title('5 mT, S12')

figure
plot(xdata(:,5), ydata2(:,5))
xlabel('Frequency (GHz)')
ylabel('Amplitude (arb.)')
title('5 mT, S12')

txt1 = '\uparrow';
text(1.28, 7.5*10^(-5), txt1, 'FontSize',14)

txt2 = 'f_{center}';
text(1.25, 4.0*10^(-5), txt2, 'FontSize',11)

txt3 = '\rightarrow';
txt4 = '\leftarrow';
txt5 = '\Deltaf';

text(1.282, 0.0005101, txt3, 'FontSize',11)
text(1.201, 0.0005101, txt4, 'FontSize',11)
text(1.241, 0.0005301, txt5, 'FontSize',11)



