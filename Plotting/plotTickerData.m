% requires packages:
% - io
% - statistics
% - financial
 
% Clear existing
clear; 
close all;
 
% Load package
pkg load io;
pkg load statistics;
pkg load financial;
 
% Grab data
% format = {Date,   open,   High,   Low,    close,  Adj close*, Volume}
%connection = yahoo();
ticker = 'AAPL';
ticker = 'MRAM';
fromDate = "01-Jan-2016";
endDate = "30-Jan-2018";
endDate = date; % "30-Jan-2018";
endDate

frequency = "d";
%[d f] = fetch(connection, ticker, fromDate, endDate, frequency);

%[d, f]] = urlread(strcat('https://ichart.finance.yahoo.com/table.csv?s='... ,tickers{i},'&a=',bm,'&b=',bd,'&c=',by,'&d=',em,'&e=',ed,'&f=',... ey,'&g=',freq,'&ignore=.csv'));% urlread2.urlread2( ... do the same
%d = fetch(google(), "SNE", "01-Jan-2016", "31-Dec-2017", "d");

%d = fetch(google(), "SNE", "01-Jan-2014", "31-Dec-2016", "d");

d = fetch(google(), ticker, fromDate, endDate, frequency);

d = flip(d);
dates = d(:,1);
openPrice = d(:,2);
high = d(:,3);
low = d(:,4);
closePrice = d(:,5);
 
% Plot data
h=figure(1);
highlow(high, low, openPrice);
%candle(high, low, openPrice);
titlestr = strcat('High Low Plot : ', ticker);
layout(gca, ticker, dates, titlestr);
defaultSavePlot(h, "highlow.png");
 
h=figure(2);
bolling(openPrice,3)
titlestr = strcat('Bolling Bands Plot : ', ticker);
layout(gca, ticker, dates, titlestr);
defaultSavePlot(h, "bolling.png");
 
h=figure(3);
pointfig(openPrice)
titlestr = strcat('Point Figure Plot : ', ticker);
layout(gca, ticker, dates, titlestr);
defaultSavePlot(h, "pointfig.png");
 
renko([dates openPrice]);
title(gca, strcat('Renko Plot : ', ticker));
xlabel(gca, 'Time');
ylabel(gca,'Price');
grid on;
defaultSavePlot(gcf, "renko.png");