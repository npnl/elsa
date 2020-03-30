function ASSD = computeASSD(L1, L2)
% L1: manual label
% L2: auto label

% Extract voxels on the surface
L1_xshiftP=circshift(L1.data, 1, 1);
L1_xshiftN=circshift(L1.data, -1, 1);
L1_yshiftP=circshift(L1.data, 1, 2);
L1_yshiftN=circshift(L1.data, -1, 2);
L1_zshiftP=circshift(L1.data, 1, 3);
L1_zshiftN=circshift(L1.data, -1, 3);

L1_X1Edge=L1.data>0 & L1_xshiftP==0;
L1_X2Edge=L1.data>0 & L1_xshiftN==0;
L1_Y1Edge=L1.data>0 & L1_yshiftP==0;
L1_Y2Edge=L1.data>0 & L1_yshiftN==0;
L1_Z1Edge=L1.data>0 & L1_zshiftP==0;
L1_Z2Edge=L1.data>0 & L1_zshiftN==0;

L1SurfPt=L1_X1Edge + L1_X2Edge + L1_Y1Edge + L1_Y2Edge + L1_Z1Edge + L1_Z2Edge;

L2_xshiftP=circshift(L2.data, 1, 1);
L2_xshiftN=circshift(L2.data, -1, 1);
L2_yshiftP=circshift(L2.data, 1, 2);
L2_yshiftN=circshift(L2.data, -1, 2);
L2_zshiftP=circshift(L2.data, 1, 3);
L2_zshiftN=circshift(L2.data, -1, 3);

L2_X1Edge=L2.data>0 & L2_xshiftP==0;
L2_X2Edge=L2.data>0 & L2_xshiftN==0;
L2_Y1Edge=L2.data>0 & L2_yshiftP==0;
L2_Y2Edge=L2.data>0 & L2_yshiftN==0;
L2_Z1Edge=L2.data>0 & L2_zshiftP==0;
L2_Z2Edge=L2.data>0 & L2_zshiftN==0;

L2SurfPt=L2_X1Edge + L2_X2Edge + L2_Y1Edge + L2_Y2Edge + L2_Z1Edge + L2_Z2Edge;

% compute Euclidean distance for surface L1
CoordL1=findn(L1SurfPt > 0);
CoordL2=findn(L2SurfPt > 0);
AD_L1=zeros(1, length(CoordL1));

%get all euclidean distances for each surface point in L1
for i=1:length(CoordL1)
    AD_L1(i)=min(dist3(CoordL1(i,:), CoordL2));
end

%get average surface distance for L1
ASD_L1 = sum(AD_L1) / length(CoordL1);

AD_L2=zeros(1, length(CoordL2));

for i=1:length(CoordL2)
    AD_L2(i)=min(dist3(CoordL2(i,:), CoordL1));
end
ASD_L2 = sum(AD_L2) / length(CoordL2);

ASSD = (ASD_L1 + ASD_L2) / 2;

