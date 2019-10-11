function [theta,xp,R] = radonTransform(I)
theta = 0:179;
[R,xp] = radon(I,theta);
figure;
imagesc(theta,xp,R);
colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar