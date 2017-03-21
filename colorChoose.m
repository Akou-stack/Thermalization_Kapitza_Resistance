function [colorPlus,colorMinus] = colorChoose(ii)

% function to determine wich combinaison of marker/color/line use to plot

testModulo = mod(ii,7);
 
if testModulo == 0
   
    testModulo = 7;
    
end

% cellColorchoose{1} = '+r';
% cellColorchoose{2} = 'og';
% cellColorchoose{3} = '*b';
% cellColorchoose{4} = '.c';
% cellColorchoose{5} = 'xm';
% cellColorchoose{6} = 'sy';
% cellColorchoose{7} = 'dk';

cellColorchoose{1} = 'r';
cellColorchoose{2} = 'g';
cellColorchoose{3} = 'b';
cellColorchoose{4} = 'c';
cellColorchoose{5} = 'm';
cellColorchoose{6} = 'y';
cellColorchoose{7} = 'k';

if nargout == 1
    
    colorPlus = strcat('-',cellColorchoose{testModulo});
    
elseif nargout == 2
    
    colorPlus = strcat('-',cellColorchoose{testModulo});
    colorMinus = strcat('--',cellColorchoose{testModulo});
    
else
    
    error('This function needs at least one output argument')
    
end

end