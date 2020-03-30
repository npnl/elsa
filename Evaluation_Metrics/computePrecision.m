function Pre = computePrecision(L1, L2)
% L1: manual label
% L2: auto label

% recall = TP / (TP + FP)
volTP = length(find(L1.data>0 & L2.data>0));
volFP = length(find(L1.data==0 & L2.data>0));

Pre = volTP / (volTP + volFP);