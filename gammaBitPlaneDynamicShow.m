function gammaBitPlaneDynamicShow(I,firstArrivalsReference)
figHandle = figure;
set(gcf,'outerposition',get(0,'screensize'));
% subplot(2,3,6);
% draw_fill_axes(I,1);
for i = 1:0.1:6
    for j = 7        
        gwave = gammaTransform(I,1,i);        
        subplot(2,3,6);
        showImageWave(gwave,1);        
        h = fspecial('gaussian',10,2);
        gwave = imfilter(gwave,h,'symmetric','same');
        bitPlaneImage = bitPlane(transform2Image(gwave),j);
        bitPlaneImage8 = bitPlane(transform2Image(gwave),8);
        bitPlaneImage = bitPlaneImage+bitPlaneImage8;
        subplot(2,3,1);
        showImageWave(bitPlaneImage,1);        
        title(strcat('\gamma=',num2str(i),' and bitPlane:',num2str(j)));

        subplot(2,3,2);
        imagesc(bitPlaneImage);
        title(strcat('Mesh : \gamma=',num2str(i),' and bitPlane:',num2str(j)));

        subplot(2,3,3);
        mn = [6,6];
        bitPlaneImage = dilateGray(bitPlaneImage,mn);
        len = 8;
        deg = 30;
        bitPlaneImage = erodeGray(bitPlaneImage,len,deg);
        mesh(bitPlaneImage);
        title(strcat('Close : mesh ','len=',num2str(len),'deg=',num2str(deg)));

        subplot(2,3,4);
        imagesc(bitPlaneImage);
        title(strcat('Close : imagesc','len=',num2str(len),'deg=',num2str(deg)));
        
        waveax = subplot(2,3,5);
        cla(waveax);
        draw_fill_axes(I,1);
        firstArrivals = getFirstArrivals(bitPlaneImage);
        hold on;
        plot(firstArrivals,0:length(firstArrivals)-1,'linestyle','none','marker','o','markersize',5);
        plot(firstArrivalsReference,0:length(firstArrivalsReference)-1,'linestyle','none','marker','o','markersize',5,'color','r');
        hold off;
        
        pause(1);
    end
end