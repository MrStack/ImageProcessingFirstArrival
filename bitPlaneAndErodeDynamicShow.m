function bitPlaneAndErodeDynamicShow(I)
figHandle = figure;
for i = 1:8
    bitNPlane = bitPlane(I,i);
    subplot(2,2,1);
    showImageWave(bitNPlane,1);
    title(strcat('Bit plane:',num2str(i)));
    
    subplot(2,2,2);
    mesh(bitNPlane);
    
    subplot(2,2,3);
    mn = [6,6];
    bitNPlane = dilateGray(bitNPlane,mn);
    len = 6;
    deg = 30;
    bitNPlane = erodeGray(bitNPlane,len,deg);
    mesh(bitNPlane);
    title(strcat('len=',num2str(len),'deg=',num2str(deg)));
    
    subplot(2,2,4);
    imagesc(bitNPlane);
   
    pause(2);
end