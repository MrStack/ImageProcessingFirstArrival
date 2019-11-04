function indices = adjacentSearch(wave,coordinates,windowSize)
size_ = size(wave);
coordinates = reshape(coordinates,1,[]);
ranges = repmat(coordinates,2,1)+[-windowSize;windowSize];
result = zeros(windowSize*2,size_(2));
for j = 1:size_(2)
    rowIndex = 1;
    for i = ranges(1,j):ranges(2,j)
        result(rowIndex,j) = sum(wave(i-windowSize+1:i,j))/sum(wave(i+1:i+windowSize,j));
        rowIndex = rowIndex+1;
    end
end
[ignored,indices] = max(result);