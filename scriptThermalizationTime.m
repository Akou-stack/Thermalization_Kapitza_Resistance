% Script to plot curve : Thermalization time as a function of TG period

%  Write by Valentin Besse
% CC-BY-SA

clearvars,
close all,
clc,

textSize = 18;  % text size (for plot)
lineWidth = 3;  % line width (for plot)

cSAW = 6000;    % velocity of surface acoustic wave

TG = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
% tTherm1 = [14,55,120,215,342,480,661,879,1076,1369];
tTherm1 = [24,96,472,962,1653,2517,3544,4576,5788,6995]; % thermalization time with right value for Kapitza resistance

legendPlot{1} = 'Thermalization';
legendPlot{2} = 'SAW period (long wavelength)';

omegaSAW = cSAW.*(2*pi)./(TG.*1e-6);

fSAW = omegaSAW./(2*pi);

tSAW = 1./fSAW;

nt = length(TG);

for ii = 1:nt
    
    fprintf('For TG period = %1.1f um \t Thermalization time = %u ps \t Acoustic period = %3.0f ps.\n',TG(ii),tTherm1(ii),tSAW(ii)/1e-12);
    
end

% figure(1)
% plot(TG,fSAW/1e12,'-k','LineWidth',lineWidth-1,'Marker','+','MarkerSize',10)
% ylabel('THz'),
% xlabel('TG period (um)')
% 
% figure(2)
% plot(TG,tSAW./1e-12,'-k','LineWidth',lineWidth-1,'Marker','+','MarkerSize',10)
% ylabel('Acoustic period (ps)'),
% xlabel('TG period (um)')

figure(3)
plot(TG,tTherm1,'-r','LineWidth',lineWidth-1,'Marker','+','MarkerSize',10);
hold on
% plot(TG,tTherm2,'-b','LineWidth',lineWidth-1,'Marker','+','MarkerSize',10);
plot(TG,tSAW./1e-12,'-k','LineWidth',lineWidth-1,'Marker','+','MarkerSize',10);
hold off
% set(gca,'MarkerSize',10);
axis('tight');
set(gca,'YDir','normal');
set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
xlabel('Transient grating period (\mum)');
ylabel('Time (ns)');
% set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gcf,'units','normalized','outerposition',[0 0 0.5 0.5])
xlim([0.1 1]);
ylim([0 8000]);
set(gca,'YTick',[0 1 2 3 4 5 6 7 8].*1e3);
set(gca,'YTickLabel',[0 1 2 3 4 5 6 7 8]);
filename = 'tThermVsTGPeriodCoFeB';
legend(legendPlot,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
print('-opengl',strcat(filename,'.eps'),'-depsc2','-loose');