function I = bitPlane(I,n)
I = bitand(I,2^(n-1));