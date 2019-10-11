function gifSaver(figureHandle,fileName,delayTime)
F=getframe(figureHandle);
G=frame2im(F);
[G,map]=rgb2ind(G,256);
if ~isfile(fileName)
    imwrite(G,map,fileName,'gif', 'Loopcount',inf,'DelayTime',delayTime);
else
    imwrite(G,map,fileName,'gif','WriteMode','append','DelayTime',delayTime);
end