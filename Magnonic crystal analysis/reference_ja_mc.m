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

figure
plot(xdata(:,1), ydata2(:,1),'color',[0 0.5 0])
hold on
plot(xdata(:,1), ydata2(:,2), 'r')
xlabel('Frequency (GHz)')
ylabel('Amplitude (arb. units)')
legend('MC', 'reference')


