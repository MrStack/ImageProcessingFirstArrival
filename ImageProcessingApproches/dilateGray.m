function I = dilateGray(I,mn)
SE = strel('rectangle',mn);
I = imdilate(I,SE);