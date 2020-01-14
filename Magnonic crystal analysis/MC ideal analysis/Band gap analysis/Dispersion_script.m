close all
clear

F = dir('Copy_of_5.00mT_135.00deg_985232730.txt');

xdata = zeros(512, length(F));
ydata1 = xdata;
ydata2 = xdata;

rfreq = [1.271 1.410 1.538];
ramp = [0.0001029, 0.0001449, 0.0001387];

for k = 1:length(F)  
   read = dlmread(F(k).name);
  
   xdata(:,k) = read(:,1);
   ydata1(:,k) = read(:,6);
   ydata2(:,k) = read(:,2);
   
   figure
   plot(xdata(:,k), ydata1(:,k))
   xlabel('Frequency (GHz)')
   ylabel('Re(permeability)')
   set(gca,'FontSize',11.5);
   
  % title(F(k).name)
   
   h = figure;
   plot(xdata(:,k), ydata1(:,k))%, 'Color', [0 0.5 0])
   xlabel('Frequency (GHz)')
   ylabel('Re(S_{12}) (arb. units)')
   hold on
%   plot(rfreq, ramp, 'o', 'markers', 13)
   set(gca,'FontSize',11.6)
   legend('Raw data', 'Bandgap centers')
   xlim([0.7,2])
   
   set(h,'Units','Inches');

pos = get(h,'Position');

set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(h,'filename','-dpdf','-r0')
   
  % title('5 mT')
   
end

% Plotting

h = 50; % 5 mT so 0.5 Oe
y = 2.84; % Mhz/Oe
meff = 2290; % 4\pi*M_eff (Gauss)

fh = y*h;
fm = y*meff;

k = linspace(0, 0.4, 1000);
d0 = 130*0+0.25;

bragg = (1:4)*pi/25;

f1 = sqrt((fh + fm/2).^2 - (fm/2).^2*exp(-2*k*d0));


figure
plot(f1, k)
xlabel('Frequency (GHz)')
ylabel('Wave vector (rad/\mum)')
title('a30, w2.5')
yticks(bragg)
yticklabels({'\pi/a', '2\pi/a', '3\pi/a', '4\pi/a'})
set(gca,'FontSize',11);
grid on

% Dispersion formula from paper

H_ext = 5; % mT
H_ani = 1.5; % mT
Ms = 229*0+219; % mT
d = 0.23; % \mum
a = 30; % \mum

kk = linspace(0, 0.35,100);
conversion = 4*pi*10^(-7);
bragg2 = (1:3)*pi/a;
gamma = 0.028;

f2 = gamma*sqrt((H_ext + H_ani)*(H_ext + H_ani + Ms) + Ms^2/4*(1-exp(-2*kk*d)));

f2D = gamma*sqrt((H_ext + H_ani)*(H_ext + H_ani + Ms) + Ms^2/4*(1-exp(-2*bragg2*d)));

h1 = figure;
plot(kk, f2, 'Color', [0 0.4 0])
ylabel('Frequency (GHz)')
xlabel('Wave vector (rad /\mum)')
%title('a30w2.5, 5 mT')
xticks(bragg2)
xticklabels({'\pi/a', '2\pi/a', '3\pi/a'})
%rfreq = [1271 1410 1538];
%ramp = [0.0001061, 0.0001449, 0.0001387];
hold on
grid on
plot(bragg2, rfreq,'o', 'markers', 13)
set(gca,'FontSize',11.6)
legend('Dispersion curve', 'Band gap positions')
%plot(rfeq, ramp)
   set(h1,'Units','Inches');

pos = get(h1,'Position');

set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(h1,'filename','-dpdf','-r0')


h2 = figure;
plot(kk, f2, 'Color', [0 0.4 0])
ylabel('Frequency (GHz)')
xlabel('Wave vector (rad /\mum)')
%title('a30w2.5, 5 mT')
%xticks(bragg2)
%xticklabels({'\pi/a', '2\pi/a', '3\pi/a'})
%rfreq = [1271 1410 1538];
%ramp = [0.0001061, 0.0001449, 0.0001387];
hold on
grid on
plot(bragg2, rfreq,'o', 'markers', 13)
set(gca,'FontSize',11.6)
%legend('Calculated dispersion curve', 'Band gap centers')
%plot(rfeq, ramp)
   set(h2,'Units','Inches');

pos = get(h2,'Position');

set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(h2,'filename','-dpdf','-r0')

ax1=gca;

%ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');

%set(ax1,'YAxisLocation','Right');
%set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');


% set(ax2, 'XLim', get(ax1, 'XLim'),'YLim', get(ax1, 'YLim'));
% 
% set(ax2, 'XTick', get(ax1, 'XTick'), 'YTick', get(ax1, 'YTick'))

% OppTickLabels = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k'}
% 
% % Set the x-tick and y-tick  labels for the second axes
% 
% set(ax2, 'XTickLabel', OppTickLabels,'YTickLabel',OppTickLabels);


%rfreq = [1271 1410 1538]; % Real central frequencies

f2(100)

% h3 = figure;
% plot(k, f31)
% hold on
% plot(k, f32)
% xlabel('Wavevector k (rad/\mum)')
% ylabel('Frequency (MHz)', 'FontSize', 11)
% legend({'130 nm', '260 nm'}, 'FontSize', 12)
% title('MSSW')
% 
% set(h3,'Units','Inches');
% 
% pos = get(h3,'Position');
% 
% set(h3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
% 
% print(h3,'filename','-dpdf','-r0')


