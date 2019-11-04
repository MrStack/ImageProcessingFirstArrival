function accuracyStatisticsOfBitPlanes(wave,firstArrivalsReference)
gamma = 1:0.1:2.5;
accuracysOneBitplane = zeros(length(gamma),8);
accuracysTwoBitplanes = zeros(length(gamma),7);
tolerence = 5;
for i = 1:length(gamma)
    wave = gammaTransform(wave,1,gamma(i));                
    for j = 1:8        
        bitPlaneImage = bitPlane(transform2Image(wave),j);    
        se = structElement(5,30);
        %bitPlaneImage = imopen(bitPlaneImage,se);
        bitPlaneImage = imclose(bitPlaneImage,se);
        firstArrivals = getFirstArrivals(bitPlaneImage);
        accuracysOneBitplane(i,j) = accuracy(firstArrivals,firstArrivalsReference,5);    

        if j<8
            twoBitPlaneImage = bitPlane(transform2Image(wave),j)+bitPlane(transform2Image(wave),j+1);
            twoBitPlaneImage = imopen(twoBitPlaneImage,se);
            twoBitPlaneImage = imclose(twoBitPlaneImage,se);
            tfirstArrivals = getFirstArrivals(twoBitPlaneImage);
            accuracysTwoBitplanes(i,j) = accuracy(tfirstArrivals,firstArrivalsReference,tolerence);
        end
    end
end
fighandle = figure;
set(fighandle,'outerposition',get(0,'screensize'));
ax1 = subplot(1,2,1);
[X,Y] = meshgrid(1:8,gamma);
surf(ax1,X,Y,accuracysOneBitplane);
title('One bit plane.');
xlabel('Bit-plane count');
ylabel('\gamma');
zlabel('Accuracy');
colorbar;

ax2 = subplot(1,2,2);
[X,Y] = meshgrid(1:7,gamma);
surf(ax2,X,Y,accuracysTwoBitplanes);
title('Two bit planes.');
xlabel('Bit-planes count');
ylabel('\gamma');
zlabel('Accuracy');
colorbar;

for i = 0:360
    view(ax1,[i,45]);
    view(ax2,[i,45]);
%     pause(0.02);
    gifSaver(fighandle,'wave3errorshow.gif',0.02);
end

% figure;
% mesh(bitPlane(transform2Image(wave),7)+bitPlane(transform2Image(wave),8));
% draw_fill_axes(wave,1);