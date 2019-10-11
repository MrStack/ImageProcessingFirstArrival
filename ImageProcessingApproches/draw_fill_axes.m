function draw_fill_axes(wave,interval)
hold on;

index = wave >= 0;
half_wave = zeros(size(wave));
half_wave(index) = wave(index);
for i=1:size(wave,2)
    plot(0:size(wave,1)+1,[(i-1)*interval;wave(:,i)+(i-1)*interval;(i-1)*interval],'black');
    fill(0:size(wave,1)+1,[(i-1)*interval;half_wave(:,i)+(i-1)*interval;(i-1)*interval],'black');
end
hold off;
%Set the axis limits
axis([0 size(wave,1) 0 (size(wave,2)-1)*interval]);
xlabel('Samples');ylabel('trace number');
%Set view
view([90,90]);
set(gca,'YAxisLocation','right');

return;