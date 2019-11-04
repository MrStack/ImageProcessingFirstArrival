function results = diffDegStatistics(wave,ref)
degrees = [10:10:80,100:10:170];
results = zeros(length(degrees),size(wave,2));
kh = figure;
for i = 1:length(degrees)    
    k = generateKernel(31.25,0.002,10,degrees(i));
    clf;
    draw_fill_axes(k,1);
    gifSaver(kh,'kernel.gif',0.2);
    cwave = conv2(wave,k,'same');
    firstArrivals = findFirstArrivals(cwave);
    results(i,:) = firstArrivals;    
    
end
acc = zeros(1,length(degrees));
for i = 1:length(degrees)
    acc(i) = accuracy(results(i,:),ref,50);
end
figure;plot(results','o');
accstr = strcat(num2str(degrees'),' : ',num2str(acc'*100),'%');
legend(accstr,'location','best');
figure;bar(degrees,acc);

function fa = findFirstArrivals(cwave)
[ignore,fa] = max(cwave);