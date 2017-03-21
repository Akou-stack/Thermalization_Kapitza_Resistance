function figureDrawingModuleCoFeB(plotFigure,numberFile,fileNameBegin,~,fileName)

% function associated with scriptAnalyze.
% Figure drawing loop

if plotFigure == 1
    
    textSize = 18;
    
    legendTemp = cell(1,2*numberFile);
    legendTExp = cell(1,2*numberFile);
    legendAmp = cell(1,numberFile);
    legendInt = cell(1,numberFile);
    
    disp('Figure drawing.')
    
    for ii = 1:numberFile
        
        [colorPlus,colorMinus] = colorChoose(ii);
        
        
        
        load(strcat(fileNameBegin,fileName{ii},'.mat'))
        
        figure(1)
        plot(t,TMax,colorPlus,t,TMin,colorMinus)
        hold on
        legendTemp{2*(ii-1)+1} = strcat('T(x_{max},z_I,t), R_K =',fileName{ii},' K.m^2/W');
        legendTemp{2*(ii)} = strcat('T(x_{min},z_I,t), R_K =',fileName{ii},' K.m^2/W');
        
        
        
        figure(2)
        plot(t,intTMax.*1e10,colorPlus,t,intTMin.*1e10,colorMinus)
        hold on
        legendTExp{2*(ii-1)+1} = strcat('\Delta L(x_{max},t), R_K =',fileName{ii},' K.m^2/W');
        legendTExp{2*(ii)} = strcat('\Delta L(x_{min},t), R_K =',fileName{ii},' K.m^2/W');
        
        
        
        figure(3)
        plot(t,ampTexp,colorPlus)
        hold on
        legendAmp{(ii)} = strcat('A(\Delta L(t)), R_K =',fileName{ii},' K.m^2/W');
        
        
        figure(4)
        plot(t,intTexp,colorPlus);
        hold on
        legendInt{ii} = strcat('I (\Delta L(t)), R_K =',fileName{ii},' K.m^2/W');
        
        
        figure(5)
        plot(t(indicetRescale:end),TMax(indicetRescale:end),colorPlus,t(indicetRescale:end),TMin(indicetRescale:end),colorMinus);
        hold on
        
        
        figure(6)
        plot(t(indicetRescale:end),intTMax(indicetRescale:end).*1e10,colorPlus,t(indicetRescale:end),intTMin(indicetRescale:end).*1e10,colorMinus)
        hold on
        
        
        figure(7)
        plot(t(indicetRescale:end),ampTexp(indicetRescale:end),colorPlus)
        hold on
        
        
        figure(8)
        plot(t(indicetRescale:end),intTexp(indicetRescale:end),colorPlus);
        hold on
        
        
        %     figure(9)
        %     filename = 'IntDeltaThermExpComp_VS_time';
        %     plot(t,intTcomp2,'-r',t,intTcompK2,'-b',t,intTcompKInt2,'-k',t,(y-y(end)+intTcomp2(end)),'m',t,(y-y(end)+intTcompK2(end)),'m',t,(y-y(end)+intTcompKInt2(end)),'m')
        %     axis('tight');
        %     set(gca,'YDir','normal');
        %     set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
        %     xlabel('Time (ns)');
        %     ylabel('(\delta T_{exp}(t))^2');
        
    end
    
    figure(1)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('Temperature (K)');
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    filename = 'Temperature_VS_time';
    legend(legendTemp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(2)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('\Delta L (x10^{-10})');
    filename = 'ThermalExpansion_VS_time';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendTExp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(3)
    filename = 'DeltaThermExp_VS_time';
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('A(\Delta L(t))');
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendAmp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(4)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('I (\Delta L(t))');
    filename = 'IntDeltaThermExp_VS_time';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendInt,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(5)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('Temperature (K)');
    filename = 'Temperature_VS_time_RS';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendTemp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(6)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('\Delta L (x10^{-10})');
    filename = 'ThermalExpansion_VS_time_RS';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendTExp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(7)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('A(\Delta L(t))');
    filename = 'DeltaThermExp_VS_time_RS';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendAmp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    figure(8)
    axis('tight');
    set(gca,'YDir','normal');
    set(gca,'FontName','CMU Serif','FontSize',textSize-3,'FontWeight','normal');
    xlabel('Time (ns)');
    ylabel('I (\Delta L(t))');
    filename = 'IntDeltaThermExp_VS_time_RS';
    set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    legend(legendInt,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    % figure(9)
    % filename = 'IntDeltaThermExpComp_VS_time';
    % set(gcf,'units','centimeters','outerposition',[0 0 30 20])
    % legend(legendTemp,'FontName','CMU Serif','FontSize',textSize-9,'FontWeight','normal')
    % print('-opengl',strcat(filename,'.png'),'-dpng','-loose');
    
    clear ii
   
    close all
    
end

end