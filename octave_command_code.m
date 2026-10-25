Z0=50; ZL=300; f0=2.4e9; k=1;
c=3e8; thr=0.1;
ZT=sqrt(Z0*ZL); L=c/(4*f0);
f=linspace(0.25*f0,1.75*f0,500); theta=(pi/2)*(f/f0);
Zin=ZT*(ZL*cos(theta)+1j*ZT*sin(theta))./(ZT*cos(theta)+1j*ZL*sin(theta));
G=abs((Zin-Z0)./(Zin+Z0)); G0=abs((ZL-Z0)/(ZL+Z0));
VSWR0=(1+G0)/(1-G0); RL=-20*log10(G+eps); RL0=-20*log10(G0);
idx=find(G<thr); fl=f(idx(1)); fh=f(idx(end)); fracBW=100*(fh-fl)/f0;
printf('Z0=%d ZL=%d ZT=%.2f L=%.2f mm |G|=%.3f VSWR=%.2f BW=%.3f-%.3f GHz FracBW=%.1f%%\n',Z0,ZL,ZT,L*1e3,G0,VSWR0,fl/1e9,fh/1e9,fracBW)
figure(k); set(gcf,'Position',[100 50 1000 800]);
subplot('Position',[0.09 0.57 0.64 0.35])
plot(f/1e9,G0*ones(size(f)),'k--','LineWidth',2); hold on
plot(f/1e9,G,'b','LineWidth',2)
plot([fl fl]/1e9,[0 1],'g--','LineWidth',2)
plot([fh fh]/1e9,[0 1],'g--','LineWidth',2)
grid on; ylim([0 1.3]); xlim([f(1) f(end)]/1e9)
xlabel('Frequency (GHz)'); ylabel('Reflection coefficient |\Gamma|')
title('Reflection coefficient with and without transformer')
legend('Without transformer','With transformer','Bandwidth edges','Location','eastoutside')
subplot('Position',[0.09 0.08 0.64 0.35])
plot(f/1e9,RL,'m','LineWidth',2); hold on
plot(f/1e9,RL0*ones(size(f)),'k--','LineWidth',2)
grid on; ylim([0 40]); xlim([f(1) f(end)]/1e9)
xlabel('Frequency (GHz)'); ylabel('Return loss (dB)'); title('Return loss vs frequency')
legend('With transformer','Without transformer','Location','eastoutside')
print -dpng case1.png
