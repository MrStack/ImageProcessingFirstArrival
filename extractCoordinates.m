function coordinates = extractCoordinates(cursor_info)
lengthOfCoordinates = length(cursor_info);
coordinates = zeros(lengthOfCoordinates,2);
for i = 1:lengthOfCoordinates
    coordinates(i,:) = cursor_info(i).Position;
end