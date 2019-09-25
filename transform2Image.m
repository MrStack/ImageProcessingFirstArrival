function g = transform2Image(f)
K = 255;
fm = f - min(f,[],'all');
maxfm = max(fm,[],'all');
g = uint8(K*(fm/maxfm));