function Dice = computeDice(L1, L2)


% Dice index: Dice = 2 * (L1 overlap L2) / (L1 + L2)
volL1 = length(find(L1.data>0));
volL2 = length(find(L2.data>0));

volL1_L2 = length(find(L1.data>0 & L2.data>0));
Dice = 2 * volL1_L2 / (volL1 + volL2);
