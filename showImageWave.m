function showImageWave(I,negTrueOrFalse)
if negTrueOrFalse
    imshow(negtiveTransform(scale2Fit(I)));
else
    imshow(scale2Fit(I));
end