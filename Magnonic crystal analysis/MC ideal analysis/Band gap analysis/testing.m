close all
clear

plot(1:10);

% First, store the handle to those axes.

% Next create a second set of axes, 

% position This on top of the first and make it transparent.

ax1=gca;

ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');

set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');

% set the same Limits and Ticks on ax2 as on ax1;

set(ax2, 'XLim', get(ax1, 'XLim'),'YLim', get(ax1, 'YLim'));

set(ax2, 'XTick', get(ax1, 'XTick'), 'YTick', get(ax1, 'YTick'));

OppTickLabels = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k'}

% Set the x-tick and y-tick  labels for the second axes

set(ax2, 'XTickLabel', OppTickLabels,'YTickLabel',OppTickLabels);
