function gammaCloseDynamicShow(I)
figHandle = figure;
for i = 1:0.1:6
    gwave = gammaTransform(I,1,i);
    subplot(2,2,1);
    showImageWave(gwave,1);
    title(strcat('\gamma=',num2str(i)));
    
    subplot(2,2,2);
    mesh(gwave);
    
    subplot(2,2,3);
    mn = [6,6];
    gwave = dilateGray(gwave,mn);
    len = 6;
    deg = 30;
    gwave = erodeGray(gwave,len,deg);
    mesh(gwave);
    title(strcat('len=',num2str(len),'deg=',num2str(deg)));
    
    subplot(2,2,4);
    imagesc(gwave);
    
    pause(1);
end