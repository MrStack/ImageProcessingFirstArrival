function bitPlaneDynamicShow(I)
figHandle = figure;
for i = 1:8
    bitNPlane = bitPlane(I,i);
    subplot(1,2,1);
    showImageWave(bitNPlane);
    title(strcat('Bit plane:',num2str(i)));
    subplot(1,2,2);
    mesh(bitNPlane);    
    gifSaver(figHandle,'bitPlaneDynamicShow.gif',1);    
    pause(1);
end