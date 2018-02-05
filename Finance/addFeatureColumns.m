% add difference from current period to last period
%
% Input: format = {Date,open, High, Low, close, volume} -- date ascending

function [featureM, labelV, percentageThreshold] = addFeatureColumns(inputData)
  % threshold = percentage which marks an extraordary breakout (in both directions) - it's the mean over all changes
  %
  % helpM(:,1) = openPriceShiftByMinusOne
  % helpM(:,2) = abs. Diff last close to next open
  % helpM(:,3) = percentage Diff last close to next open
  %
  % featureM(:,1) = Volume
  % featureM(:,2) = %Diff last close to next open
  %
  % labelV(i) = +1 if percentage change is larger than threshold
  % labelV(i) = -1 if percentage change is smaller than - threshold
  % labelV(i) = 0, else
  
  rowNumber = size(inputData,1);
  
  helpM = zeros(rowNumber,3);
  featureM = zeros(rowNumber,2);
  labelV = zeros(rowNumber,1);
  
  openPrice = inputData(:,2);
  closePrice = inputData(:,5);
  %fprintf('\nsize(openPrice): %d * %d', size(openPrice,1), size(openPrice,2))
  openPriceShorter = openPrice(2:end, :);
  % fprintf('\nsize(openPriceShorter): %d * %d', size(openPriceShorter,1), size(openPriceShorter,2))
  openPriceShiftByMinusOne = [openPriceShorter; closePrice(rowNumber,1)]; % the last entry is the latest close price
  %fprintf('\nsize(openPriceShiftByMinusOne): %d * %d', size(openPriceShiftByMinusOne,1), size(openPriceShiftByMinusOne,2))

  helpM(:,1) = openPriceShiftByMinusOne;
  helpM(:,2) = openPriceShiftByMinusOne - closePrice;
  helpM(:,3) = (helpM(:,2) ./ closePrice) * 100; % percentageChange
      
  featureM(:,1) = inputData(:,6); % volume
  featureM(:,2) = helpM(:,3); % percentage difference
  
  meanPercentageChange = mean(abs(featureM(:,2)));
  percentageThreshold = ceil(meanPercentageChange) + 1;
  
  indexPos = find(helpM(:,3) > percentageThreshold); % get all indices from percentage where the value is larger than the threshold
  indexNeg = find(helpM(:,3) < -percentageThreshold); % get all indices from percentage where the value is larger than the threshold
  
  labelV(indexPos) = 1;
  labelV(indexNeg) = -1;
end