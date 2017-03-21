% Script to analyze and plot the data related to the thermal distribution

% adapt to CoFeBcalculation (Ron's project)

clearvars;
close all;
clc;

% Parameters

% Boolean
plotFigure = 0; % to draw figures
comparisonPlot = 1; % to draw a comparison figure

booleanTest = 0;    % DO NOT CHANGE


fileName{1} = '01';
fileName{2} = '02';
fileName{3} = '03';
fileName{4} = '04';
fileName{5} = '05';
fileName{6} = '06';
fileName{7} = '07';
fileName{8} = '08';
fileName{9} = '09';
fileName{10} = '1';
% fileName{2} = '01';
% fileName{3} = '001';

numberFile = size(fileName,2);

fileNameBegin = 'CoFeB_40nm_dt1ps_gr';
fileNameEnd = 'um_Kapitza6e-9';
% fileNameEnd = 'um';

% Data import loop
dataImportModuleCoFeB(fileName,fileNameBegin,fileNameEnd,numberFile);

% Figure drawing loop
figureDrawingModuleCoFeB(plotFigure,numberFile,fileNameBegin,fileNameEnd,fileName);

% Comparison plot
comparisonPlotModuleCoFeB(comparisonPlot,numberFile,fileNameBegin,fileNameEnd,fileName);





