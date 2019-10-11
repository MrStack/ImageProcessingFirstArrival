function gammaAndErodeDynamicShow(I)
figHandle = figure;
for i = 1:0.1:6
    gwave = gammaTransform(I,1,i);
    subplot(2,2,1);
    showImageWave(gwave,1);
    title(strcat('\gamma=',num2str(i)));
    
    subplot(2,2,2);
    mesh(gwave);
    
    subplot(2,2,3);
    mn = [4,4];
    gwave = erodeGray(gwave,mn);
    showImageWave(gwave,1);
    title(strcat('m=',num2str(mn(1)),'n=',num2str(mn(2))));
    
    subplot(2,2,4);
    imagesc(gwave);
    
    pause(1);
end