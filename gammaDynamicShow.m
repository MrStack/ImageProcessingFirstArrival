function gammaDynamicShow(I)
figHandle = figure;
for i = 1:0.1:6
    gwave = gammaTransform(I,1,i);
    subplot(1,2,1);
    showImageWave(gwave);
    title(strcat('\gamma=',num2str(i)));
    subplot(1,2,2);
    mesh(gwave);    
    gifSaver(figHandle,'gammaDynamicShow.gif',0.5);
    pause(0.5);
end