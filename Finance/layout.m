function layout(handle, ticker, dates, titlestr)
  title(titlestr);
  grid on;
  ticks = get (handle, "xtick");
  labels = [dates(ticks(2:size(ticks,2)-1))];
  labels = [dates(1)-1 transpose(labels) dates(size(dates,1)) + ticks(size(ticks,2)) - ticks(size(ticks,2)-1)];
  set (handle, 'xticklabel', datestr(labels,2))
  xlabel('Time');
  ylabel('Price');
end