function fa = getFirstArrivals(I)
if ~isinteger(I)
    error('Please check if the input array is integer(Image type).');
end

size_I = size(I);
fa = zeros(1,size_I(2));
for j = 1:size_I(2)
    for i = 1:size_I(1)
        if I(i,j) ~= 0
            fa(j) = i;
            break;
        end
    end
end