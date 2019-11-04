function f = accuracy(firstArrivals,firstArrivalsReference,tolerence)
firstArrivals = reshape(firstArrivals,[],1);
firstArrivalsReference = reshape(firstArrivalsReference,[],1);
length_ = length(firstArrivals);
firstArrivalsReference = firstArrivalsReference(1:length_);
lowerBound = firstArrivals >= firstArrivalsReference-tolerence;
upperBound = firstArrivals <= firstArrivalsReference+tolerence;
true = lowerBound & upperBound;
f = sum(true(:))/length_;