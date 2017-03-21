function dataImportModuleCoFeB(fileName,fileNameBegin,fileNameEnd,numberFile)

% function associated with scriptAnalyze.
% Data import loop

booleanTest = 0;    % DO NOT CHANGE

for ii = 1:numberFile
    
    if(exist(strcat(fileNameBegin,fileName{ii},fileNameEnd,'.mat'),'file')==0)
        
        if booleanTest == 0
            
            disp('Data import.')
            
            booleanTest = 1;
            
        end
        disp(ii)
        importDataCOMSOLCoFeB(strcat(fileNameBegin,fileName{ii},fileNameEnd),fileName{ii});
        
    end
    
end

clear ii

end