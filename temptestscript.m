tempwave = correction(wave,wavefirstarrivals);
tempwave = tempwave(:,end:-1:1);
degrees = [100:10:170];
fh = figure;
for i = 1:length(degrees)    
    tempwave = adjustDegree(tempwave,degrees(i));
    clf;
    draw_fill_axes(tempwave,1);
    gifSaver(fh,'adjust.gif',0.5);
end