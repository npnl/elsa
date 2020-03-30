function Recall = computeRecall(L1, L2)
% L1: manual label
% L2: auto label

% recall = TP / (TP + FP)
volTP = length(find(L1.data>0 & L2.data>0));
volFN = length(find(L1.data>0 & L2.data==0));

Recall = volTP / (volTP + volFN);