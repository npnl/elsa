% Wrapper script for getting evaluation metrics
% Kaori L Ito
% NPNL USC 2017


clc;
clear all;

ROOTDIR='';
OUTDIR='';
cd(ROOTDIR);

subjects=dir('c0*');


for i=1:length(subjects)
%for i=1:1   
    subjDir=fullfile(ROOTDIR,subjects(i).name);
    cd(subjDir);
    
    disp(subjects(i).name);
    ExpertLesion=dir('*LesionSmooth.nii');
    L1=SurfStatReadVol1(ExpertLesion.name);
    
    approaches=dir('*AutoSeg*'); %get all of the Automated Segmentation masks
   
    %for j=1:1
    for j=1:length(approaches)
        L2=SurfStatReadVol1(approaches(j).name);
        
        %get approach name (e.g., linda, lesion_gnb, etc)
        [pathstr, name, ext] = fileparts(approaches(j).name);
        approach=extractAfter(name,'AutoSeg_');
        
        try
            dice=computeDice(L1,L2);
        catch
            disp('unable to calc DI');
            dice=NaN;
        end
        dlmwrite(char(strcat(OUTDIR,'/Dice/', cellstr(approach), '.txt')),dice,'-append');
       
        try
            hd=computeHD(L1,L2);
        catch 
            disp('HD had no value assigned');
            hd=NaN;
        end
        dlmwrite(char(strcat(OUTDIR,'/HD/', approach, '.txt')),hd,'-append');
        
        
        try
        assd=computeASSD(L1,L2);
        catch
            disp('ASSD had no value assigned');
            assd=NaN;
        end
        dlmwrite(char(strcat(OUTDIR,'/ASSD/', approach, '.txt')),assd,'-append');
        
        try
            precision=computePrecision(L1,L2);
        catch
            disp('precision not calculated');
            precision=NaN;
        end
            dlmwrite(char(strcat(OUTDIR,'/Precision/', approach, '.txt')),precision,'-append');
        
        try
            recall=computeRecall(L1,L2);
        catch
            disp('recall not computed');
            recall=NaN;
        end
            dlmwrite(char(strcat(OUTDIR,'/Recall/', approach, '.txt')),recall,'-append');
        
        
    end

end


