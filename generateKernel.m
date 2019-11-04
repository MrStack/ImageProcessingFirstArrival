function k = generateKernel(f0,ts,width,degree)
halfPeriod = 1000/f0/2/(ts*1000);
k = sin(2*pi*f0*(0:halfPeriod)*ts);
halfWaveLength = length(k);
zeroLength = getZeroLength(halfWaveLength,width,degree);
if isOdd(zeroLength)
    zeroLength = zeroLength-1;
end
k = [zeros(1,zeroLength/2),k,zeros(1,zeroLength/2+1)]';
k = repmat(k,1,width);
k = adjustSizeAndDegree(1,k,degree);

function l = getZeroLength(lengthK,width,degree)
se = strel('line',width,degree);
l = (size(se.Neighborhood,1)-1)*lengthK;

function b = isOdd(x)
if x/2-floor(x/2) ~= 0
    b = 1;
else
    b = 0;
end

function k = adjustSizeAndDegree(ratio,k,degree)
width = size(k,2);
kernelAdjustMap = strel('line',width,degree);
cutSize = size(kernelAdjustMap.Neighborhood,2);
if width > cutSize
    k = k(:,1:cutSize);
    width = size(k,2);
end

middlePosition = ceil(width/2);
[ignore,positions] = max(kernelAdjustMap.Neighborhood);
middleBias = positions(middlePosition);
positions = (positions-middleBias)*ratio;
for i = 1:width
    k(:,i) = circshift(k(:,i),positions(i));
end