% Grab data: 
% Inputvariables: 
% a) ticker = name of the security, like 'MRAM'
% a) fromDate = dd-mmm-yyyy, like "01-Jan-2016"
% a) endDate = dd-mmm-yyyy, like date or "30-Jan-2018"
% a) frequency = frequency of data, d, w, m, y
% a) ticker = 
% Output: format = {Date,   open,   High,   Low,    close, volume}
% requires packages:
% - io

function data = fetchFromGoogle(ticker, fromDate, endDate, frequency)
  % Load package
  pkg load io;
  pkg load financial;
  % fetch data
  data = fetch(google(), ticker, fromDate, endDate, frequency);  
end