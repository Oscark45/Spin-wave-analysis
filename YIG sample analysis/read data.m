% This file is used to read the FMR data from the files a-q (named such
% I want to read the files in order and the original is not in order)

close all
clear

F = dir('*.txt');

xdata = zeros(512, length(F));
ydata = xdata;

for k = 1:length(F)  
   read = dlmread(F(k).name);
  
   xdata(:,k) = read(:,1);
   ydata(:,k) = read(:,6);
   
   figure
   scatter(xdata(:,k), ydata(:,k), 'o')
   legend('Measurement points')
   xlabel('Frequency (GHz)')
   ylabel('Amplitude (arb. units)')
   title(sprintf('B = %g mT', 10*k), 'interpreter', 'none')
   
end

[m, ii] = min(ydata);

h10 = figure;
hold on
box on
plot(xdata(:,1), ydata(:,1))
%plot(xdata(:,2), ydata(:,2))
plot(xdata(:,3), ydata(:,3))
%scatter(xdata(:,2), ydata(:,2), 'o')
plot(xdata(:,7), ydata(:,7))
plot(xdata(:,11), ydata(:,11))

plot(xdata(:,15), ydata(:,15))
xlabel('Frequency (GHz)')
ylabel('Re(S_{21})')
legend({'10 mT', '30 mT', '70 mT', '110 mT', '150 mT'}, 'FontSize', 14)
%set(gca,'FontSize',16)

set(h10,'Units','Inches');
pos = get(h10,'Position');
set(h10,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h10,'filename','-dpdf','-r0')
xticks([0,1,2,3,4,5,6,7,8])
set(gca,'FontSize',14)



figure
x = linspace(-0,12,1000);
y = -1 ./ (1+(x-6).^2);
plot(x,y)
ylim([-1.2, 0])
xlabel('Frequency (GHz)')
ylabel('Amplitude (Arb. units)')

txt1 = '\leftarrow FMR frequency';
text(6, -1, txt1)

txt2 = '\rightarrow';
txt3 = '\leftarrow  \Deltaf';
text(6.5, -0.5, txt2)
text(5.2, -0.5, txt3)

txt4 = '\rightarrow';
txt5 = '\leftarrow';
txt6 = '2\Deltaf';

h1 = figure;
plot(xdata(:,2), ydata(:,2), '.', 'markers', 14)
%scatter(xdata(:,2), ydata(:,2))
xlabel('Frequency (GHz)')
ylabel('Amplitude (arb. units)')
%legend({'Measurement points'}, 'FontSize', 12)
%title('B=80 mT')
xlim([1.8, 2.2])
text(2.011, -0.115, txt4, 'FontSize', 20)
text(1.99, -0.115, txt5, 'FontSize', 20)
text(1.995, -0.103, txt6, 'FontSize', 16)

set(h1,'Units','Inches');
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h1,'filename','-dpdf','-r0')
set(gca,'FontSize',11.5)

% p1 = [2 3];                         % First Point
% p2 = [9 8];                         % Second Point
% dp = p2-p1;                         % Difference
% 
% figure(1)
% quiver(p1(1),p1(2),dp(1),dp(2),0)
% grid
% axis([0  10    0  10])
% text(p1(1),p1(2), sprintf('(%.0f,%.0f)',p1))
% text(p2(1),p2(2), sprintf('(%.0f,%.0f)',p2))


%txt2 = '\leftarrow f_{FMR} = 0';
%text([4,6], [-1,1], txt2)

% %figure
% x = linspace(-4,4);
% y = x.^3 - 12*x;
% plot(x,y)
% text(6,-1,'lol')

%dim = [.2 .74 .25 .15];
%di = [.2, .74];
%annotation('doublearrow',[.1 .2],[.1 .2])

