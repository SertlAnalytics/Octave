function x = defaultSavePlot(plotHandle, name)
  W = 8; H = 6;
  set(plotHandle,'PaperUnits','inches');
  set(plotHandle,'PaperOrientation','portrait');
  set(plotHandle,'PaperSize',[H,W]);
  set(plotHandle,'PaperPosition',[0,0,W,H]);
  print(plotHandle,'-dpng','-color', name);
end