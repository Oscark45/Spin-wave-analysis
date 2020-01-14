% This file is used to do the Lorentz function fit to the FMR data that is
% read is file63.m

close all
format long

% define lorentz inline, instead of in a separate file
 lorentz = @(param, x) param(1) ./ ((x-param(2)).^2 + param(3));

 tas = 0;
 
 left = [4,4,4,6,4,3,5,5,tas+6,5,4,5,3,6,4,4,tas+4];
 right = [24,19,20,20,20,20,25,16,tas+21,14,16,15,15,16,26,20,tas+18];
 freqs = zeros(1,17);
 linew = zeros(1,17);
 
 fields = zeros(1,17);
 freqs2 = zeros(1,17);
 
for j = 1:size(xdata, 2)-17+17 % 30 done % Somewhat difficult from 24 onward
   
    x = xdata(:,j);
    y = ydata(:,j);
    
    X = x(ii(j)-left(j): ii(j) + right(j));
    Y = y(ii(j)-left(j): ii(j) + right(j));
    
   % rough guess of initial parameters
    a3 = ((max(X)-min(X))/10)^2;
    a2 = (max(X)+min(X))/2;
    a1 = max(Y)*a3;
    a0 = [a1,a2,a3];
    
    % define objective function, this captures X and Y
    fit_error = @(param) sum((Y - lorentz(param, X)).^2);
    
    % do the fit
    a_fit = fminsearch(fit_error, a0);
    x_grid = linspace(min(X), max(X), 1000); % fine grid for interpolation
    y = lorentz(a_fit, x_grid);
    
    % Extract minimum and linewidth from the function
    
    freqs(j) = a_fit(2);
    linew(j) = 0*a_fit(2)+2*sqrt(a_fit(3));%a_fit(2)+sqrt(a_fit(3));%lorentz(a_fit, a2+sqrt(a3));
    
    fields(j) = 10*j;%a_fit(2)+0*sqrt(a_fit(3));
    freqs2(j) = a_fit(2);%2*(a_fit(2)+1*sqrt(a_fit(3)));
    
    % Plot figure
    h = figure;
    
    c = 0;
    plot(X, Y+c, '.', 'markers', 14)
    hold on
    plot(x_grid, y+c, 'r')
    scatter(xdata(:,j), ydata(:,j))
    legend({'Measurement points', 'Lorentzian fit'}, 'FontSize', 12)
    title(sprintf('B = %g mT', 10*j), 'interpreter', 'none')
   % title(sprintf('a1_fit = %g, a2_fit = %g, a3_fit = %g', ...
   % a_fit(1), a_fit(2), a_fit(3)), 'interpreter', 'none')
    xlabel('Frequency (GHz)', 'FontSize', 14)
    ylabel('Amplitude (arb. units)', 'FontSize', 14)
    
    if j == 2
        
        xticks([2.01, 2.02, 2.03, 2.04])
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        print(h,'filename','-dpdf','-r0')
        set(gca,'FontSize',11.5)
        
    end
   % xticks([2.01, 2.02, 2.03, 2.04])
end
% Example
x80 = xdata(:,8);
y80 = ydata(:,8);

X80 = x(ii(8)-left(8): ii(8) + right(8));
Y80 = y(ii(8)-left(8): ii(8) + right(8));

h2 = figure;
plot(X, Y+c, '.', 'markers', 14)
hold on
plot(x_grid, y+c, 'r')

legend({'Measurement points', 'Lorentzian fit'}, 'FontSize', 12)
title('B=80 mT')
   % title(sprintf('a1_fit = %g, a2_fit = %g, a3_fit = %g', ...
   % a_fit(1), a_fit(2), a_fit(3)), 'interpreter', 'none')
xlabel('Frequency (GHz)', 'FontSize', 12)
ylabel('Amplitude (arb. units)', 'FontSize', 12)
xticks([7.4, 7.41, 7.42, 7.43])

set(h2,'Units','Inches');

pos = get(h2,'Position');

set(h2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(h2,'filename','-dpdf','-r0')


% FMR freq and magnetic field plot
 h3 = figure;
 plot(fields, freqs2, 'o', 'markers', 8)
 hold on
 % Kittel equation fit
 
 kittel = @(param, B) param(1)*sqrt(B .* (B+4*pi*param(2)));
 fit_error2 = @(param) sum((freqs2 - kittel(param, fields)).^2);
 %%% Initial guess of parameters
 p1 =  2.8*10^(-3);
 p2 = 0.14;
 p0 = [p1, p2];
 p_fit = fminsearch(fit_error2, p0);
 
 xgrid = linspace(0,180,1000);
 ygrid = kittel(p_fit, xgrid);
 plot(xgrid, ygrid)
 box on
 xlabel('Magnetic field (mT)')
 ylabel('f_{FMR} (GHz)')
 legend({'Measurement points', 'Kittel equation fit'}, 'FontSize', 14)
 title('')
 yticks(0:8)
 xticks(0:25:200)
 
set(h3,'Units','Inches');
pos = get(h3,'Position');
set(h3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h3,'filename','-dpdf','-r0')
set(gca,'FontSize',14)
 
 saveas(gcf, 'Kittel.png')
 
 % FMR frequency and linewidth plot
 h4 = figure;
 plot(freqs, linew, 'o', 'markers', 8)
 xlabel('f_{FMR} (GHz)', 'FontSize', 12)
 ylabel('\Deltaf (GHz)', 'FontSize', 12)
 xticks([0,1,2,3,4,5,6,7,8])
 hold on
 
 % Linear fit for Gilbert damping parameter
 
 start = 3; % How many points ignore from beginning
 endd = 0; % How many points ignore from end
 
 P = polyfit(freqs(start:end-endd),linew(start:end-endd),1);
 yfit = P(1)*freqs(start:end-endd)+P(2);
 plot(freqs(start:end-endd),yfit,'r');
 box on
 legend({'Measurement points', 'Linear fit'}, 'FontSize', 14)
 title('')
 set(gca,'FontSize',14)
 saveas(gcf, 'Gilbert.png')

set(h4,'Units','Inches');

pos = get(h4,'Position');

set(h4,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(h4,'filename','-dpdf','-r0')
 
saveas(gcf, 'Kittel.png')
 
