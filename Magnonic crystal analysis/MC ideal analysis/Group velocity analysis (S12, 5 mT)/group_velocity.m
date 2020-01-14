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


df = [.948-.970, 1.159-1.173, 1.318-1.332, 1.444-1.455; ...
    1.047 - 1.068, 1.244-1.258, 1.391-1.402, 1.511-1.521; ...
    1.138-1.159, 1.321-1.335, 1.462-1.472, 1.578-1.585; ...
    1.223-1.244, 1.395-1.409, 1.529-1.539, 1.641-1.648; ...
    1.304-1.321, 1.469-1.479, 1.595-1.606, 1.701-1.708]*(-2)/1; % MHz

cf = [.948+.970, 1.159+1.173, 1.318+1.332, 1.444+1.455; ...
    1.047+1.068, 1.244+1.258, 1.391+1.402, 1.511+1.521; ...
    1.138+1.159, 1.321+1.335, 1.462+1.472, 1.578+1.585; ...
    1.223+1.244, 1.395+1.409, 1.529+1.539, 1.641+1.648; ...
    1.304+1.321, 1.469+1.479, 1.595+1.606, 1.701+1.708]/2;

x = 200; % \mum
vg = df * x;

for l=1:5
    
    figure
    scatter(cf(l,:), vg(l,:))
    xlabel('Frequency (GHz)')
    ylabel('v_g (km/s)')
    title(F(l).name)
end

vgg = [8.4, 5.6, 4.0, 2.8];
cff = [1.1485, 1.328, 1.4670, 1.5815];
h2 = figure;
hold on
box on
scatter(cff, vgg, 'r')
xlabel('Frequency (GHz)')
ylabel('v_g (km/s)')
set(h2,'Units','Inches');
pos = get(h2,'Position');
set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h2,'filename','-dpdf','-r0')
set(gca,'FontSize',11.5)

% df5 = [1.138 - 1.159, 1.335 - 1.346, 1.462 - 1.472, 1.578 - 1.585]*(-2); % Differential f, GHz
% cf5 = [1.159 + 1.138, 1.335 + 1.346, 1.462 + 1.472, 1.578 + 1.585]/2; % Central f
% 
% 
% vg5 = df5 * x; % m/s
% 
% figure
% scatter(cf5, vg5)
% xlabel('Frequency (GHz)')
% ylabel('v_g (km/s)')
% 
% alpha = 2.43 * 10^(-4);
% 
% ld5 =vg5./(2*pi*alpha*cf5*10^9) ; % Propagation length, mm
% 
% figure
% scatter(cf5, 10^6*ld5)
% xlabel('Frequency (GHz)')
% ylabel('l_d (mm)')

h1 = figure;
hold on
box on
plot(xdata(:,3), ydata1(:,3))
xlabel('Frequency (GHz)')
ylabel('Re(permeability)')
set(h1,'Units','Inches');
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h1,'filename','-dpdf','-r0')
set(gca,'FontSize',11.5)
xlim([0.4, 2.2])


