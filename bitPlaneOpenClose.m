function firstArrivals = bitPlaneOpenClose(I,firstArrivalsReference)
figHandle = figure;
set(gcf,'outerposition',get(0,'screensize'));
for i = 2.3:0.1:2.3
    for j = 7        
        gwave = I;
        subplot(2,3,6);
        showImageWave(gwave,1);        
        bitPlaneImage = bitPlane(transform2Image(gwave),j);
        bitPlaneImage8 = bitPlane(transform2Image(gwave),8);
        bitPlaneImage6 = bitPlane(transform2Image(gwave),6);
        bitPlaneImage = bitPlaneImage;%+bitPlaneImage8;%+bitPlaneImage6;
        subplot(2,3,1);
        showImageWave(bitPlaneImage,1);        
        title(strcat('\gamma=',num2str(i),' and bitPlane:',num2str(j)));

        subplot(2,3,2);
        imagesc(bitPlaneImage);
        title(strcat('Mesh : \gamma=',num2str(i),' and bitPlane:',num2str(j)));

        subplot(2,3,3);
        se = structElement(8,30);
%         imopen(bitPlaneImage,se);
        imclose(bitPlaneImage,se);
        mesh(bitPlaneImage);
%         title(strcat('Close : mesh ','len=',num2str(len),'deg=',num2str(deg)));

        subplot(2,3,4);
        imagesc(bitPlaneImage);
%         title(strcat('Close : imagesc','len=',num2str(len),'deg=',num2str(deg)));
        
        waveax = subplot(2,3,5);
        cla(waveax);
        draw_fill_axes(I,1);
        firstArrivals = getFirstArrivals(bitPlaneImage);
        hold on;
        plot(firstArrivals,0:length(firstArrivals)-1,'linestyle','none','marker','o','markersize',5);
        plot(firstArrivalsReference,0:length(firstArrivalsReference)-1,'linestyle','none','marker','o','markersize',5,'color','r');
        ylabel(strcat('Accuracy:',num2str(accuracy(firstArrivals,firstArrivalsReference,5))));
        hold off;
        
        pause(1);
    end
end