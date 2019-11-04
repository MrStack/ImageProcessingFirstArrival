function edgeDetection(wave)
method = {'Sobel';'Prewitt';'Roberts';'Log';'Zerocross';'Canny';'Approxcanny'};
fig = figure;
for i = 1:size(method,1)
    e = edge(wave,method{i});
    showImageWave(double(e),1);
    title(method{i});
    gifSaver(fig,'edge.gif',1);
    pause(1);
end