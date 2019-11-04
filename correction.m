function wave = correction(wave,firstArrivals)
firstArrivals = -firstArrivals;
for i = 1:size(wave,2)
    wave(:,i) = circshift(wave(:,i),firstArrivals(i));
end