function comparisonPlotModuleCoFeB(comparisonPlot,numberFile,fileNameBegin,fileNameEnd,fileName)
% function associated with scriptAnalyzeNi.
% Comparison plot
% Adapt for Ni simulation

% Wrote by Valentin Besse
% CC-SA-BY

if comparisonPlot == 1
    
    disp('Comparison plots.')
    
    textSize = 18;  % text size (for plot)
    lineWidth = 3;  % line width (for plot)
    
    legendInt = cell(1,numberFile); % legend
    legendInt2 = cell(1,numberFile); % legend
    
    for ii = 1:numberFile   % loop over the different simulation
        
        [colorPlus] = colorChoose(ii);  % to automatically determine the color to use
        
        load(strcat(fileNameBegin,fileName{ii},fileNameEnd,'.mat')) % loading of simulation curve
        
        diffTNorm = diffT/max(diffT);
        
        %         legendInt{ii} = strcat(fileName{ii},' \mum');
        %         legendInt2{ii} = strcat(fileName{ii},' \mum');
        
        figure(1)
        plot(t,diffT,colorPlus,'LineWidth',lineWidth-1)
        hold on
        
        figure(2)
        plot(t,diffTNorm,colorPlus,'LineWidth',lineWidth-1)
        hold on
        
%         [~,b]=find(diffTNorm < 1e-4);
        [~,b]=find(diffT < 0.01);
        
        fprintf('For TG period = %2.1f um \t Thermalization time = %u ps \t T at tTherm = %5.2f K \t T at 10 ps = %5.2f K.\n',grating/1e-6,t(b(1))/1e-12,T(indiceyMax,indicex,b(1)),T(indiceyMax,indicex,end));
        
    end
    
    legendInt{1} = strcat('0.1 \mum');
    legendInt{2} = strcat('0.2 \mum');
    legendInt{3} = strcat('0.3 \mum');
    legendInt{4} = strcat('0.4 \mum');
    legendInt{5} = strcat('0.5 \mum');
    legendInt{6} = strcat('0.6 \mum');
    legendInt{7} = strcat('0.7 \mum');
    legendInt{8} = strcat('0.8 \mum');
    legendInt{9} = strcat('0.9 \mum');
    legendInt{10} = strcat('1 \mum');
    
    legendInt2{1} = strcat('0.1 \mum');
    legendInt2{2} = strcat('0.2 \mum');
    legendInt2{3} = strcat('0.3 \mum');
    legendInt2{4} = strcat('0.4 \mum');
    legendInt2{5} = strcat('0.5 \mum');
    legendInt2{6} = strcat('0.6 \mum');
    legendInt2{7} = strcat('0.7 \mum');
    legendInt2{8} = strcat('0.8 \mum');
    legendInt2{9} = strcat('0.9 \mum');
    legendInt2{10} = strcat('1 \mum');
    
    figure(1)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('\DeltaT (K)');
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    xlim([0 10].*1e-9);
    set(gca,'XTick',[0 2.5 5 7.5 10].*1e-9);
    set(gca,'XTickLabel',[0 2.5 5 7.5 10]);
    %     ylim([0.7 1.05]);
    %     set(gca,'XTickLabel',[0 0.5 1 1.5 2]);
    legend(legendInt,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    filename = 'DeltaTCoFeB';
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    print('-opengl',strcat(filename,'.eps'),'-depsc2','-loose');
    
    figure(2)
%     plot(t,ones(1,length(t)).*exp(-2),'--k')
    
%     legendInt2{numberFile+1} = '1/exp(2)';
    
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('\DeltaT (%)');
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    xlim([0 10].*1e-9);
    ylim([0 1])
    set(gca,'XTick',[0 2.5 5 7.5 10].*1e-9);
    set(gca,'XTickLabel',[0 2.5 5 7.5 10]);
    legend(legendInt2,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    filename = 'DeltaTNormCoFeB';
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    print('-opengl',strcat(filename,'.eps'),'-depsc2','-loose');
    
    close all
    
end

end