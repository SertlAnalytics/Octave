% requires packages:
% - io
% - statistics
% - financial
 
% Clear existing
clear; 
close all;

ticker = 'MRAM' % AMZN MRAM
data = fetchFromGoogle(ticker, '01-Jan-2017', date, 'd');
data = flip(data); % to sort it ascending in date

[featureM, labelV, threshold] = addFeatureColumns(data); % get feature and label data

dates = data(:,1);
openPrice = data(:,2);
high = data(:,3);
low = data(:,4);
closePrice = data(:,5);
volume = data(:,6);

differencePercentToLastPeriod = featureM(:,2);

% Plot data
%h = figure(1);
%highlow(high, low, openPrice);
%titlestr = strcat('High Low Plot : ', ticker);
%layout(gca, ticker, dates, titlestr);

% Plot open price, differenceToLastPeriod, differencePercentToLastPeriod

figure

ax_1 = subplot(2,1,1); % add fist plot into a 3 x 1 vector columns
plot(dates, openPrice);
title(ticker);
xlabel('Time');
ylabel('Price');
datetick('x', 'yyyy-mm-dd')
XGrid = 'on';
YGrid = 'on';

subplot(2,1,2); % add second plot into a 3 x 1 vector columns
hold on;
plot(dates, differencePercentToLastPeriod);
title(ticker);
xlabel('Time');
ylabel('%Diff close - open');
datetick('x', 'yyyy-mm-dd')

mIndexedPos = find(labelV > 0);
mIndexedNeg = find(labelV < 0);
plot(dates(mIndexedPos), labelV(mIndexedPos) * threshold, 'gx');
plot(dates(mIndexedNeg), labelV(mIndexedNeg) * threshold, 'ro');
hold off;
