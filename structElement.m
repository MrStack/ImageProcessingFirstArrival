function se = structElement(len,deg)
SE1 = strel('line',len,deg);
mask1 = SE1.Neighborhood;

SE2 = strel('line',len,180-deg);
mask2 = SE2.Neighborhood;

se = strel(mask1+mask2);