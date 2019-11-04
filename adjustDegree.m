function wave = adjustDegree(wave,degree)
shiftRatio = 1;
if degree == 90
    error('90 degree is not supported.');
end
se = strel('line',size(wave,2)/abs(cos(deg2rad(degree))),degree).Neighborhood;
se = se(:,end-(size(se,2)-size(wave,2)):-1:1);

[ignore,positions] = max(se);

for i = 1:size(wave,2)
    wave(:,i) = circshift(wave(:,i),positions(i)*shiftRatio);
end