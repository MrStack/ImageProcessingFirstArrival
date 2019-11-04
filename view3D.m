function view3D(wave,cwave)
figure;
set(gcf,'outerposition',get(0,'screensize'));
ax1 = subplot(1,2,1);
mesh(ax1,wave);
ax2 = subplot(1,2,2);
mesh(ax2,cwave);
while 1
    for i = 0:360        
        view(ax1,[i,45]);        
        view(ax2,[i,45]);
        pause(0.1);
    end
end