GPC_B = 153.4; %90

% rates
rPGU = 35;  % peripheral blood glucose uptake (baseline value)
rBGU = 70;  % brain glucose uptake
rGGU = 20;  % gut glucose uptake
rHGP = 155; % hepatic glucose production (not sure where this value comes from, its 35 on p25 of paper)
rHGU = 20;  % hepatic glucose uptake (basal)

% fluxes
QGP = 15.1; % 
QGA = 2.5;  %
QGB = 5.9;  %
QGG = 10.1; %
QGL = 12.6; %

% not sure what these guys are
VBT = 4.5;  % volume, brain interstitial fluid, for glucose?
VPT = 63;   % volume, peripheral tissues, for glucose? (67.4 on p33)

% time constants
TGP = 5;    % time constant, peripheral glucose
TB = 2.1;   % time constant, brain glucose

% baseline glucose values
GHC_B = GPC_B+rPGU/QGP; 
GKC_B = GHC_B; 
GBC_B = GHC_B-rBGU/QGB; 
GSC_B = GHC_B-rGGU/QGG; 
GLC_B = (QGA*GHC_B+QGG*GSC_B+rHGP-rHGU)/QGL; 
GBT_B = GBC_B-rBGU*TB/VBT; 
GPT_B = GPC_B-rBGU*TGP/VPT; 

% baseline inuslin values
IPC_B = 5.9; 
% multipliers for rate constants (3.39, 3.40, 3.41)
FPIC = 0.15;  
FKIC = 0.3;  
FLIC = 0.4;
% insulin fluxes (consistent with paper)
QIP = 1.05;  
QIH = 3.12;  
QIB = 0.45;  
QIK = 0.72;  
QIL = 0.9;  
QIG = 0.72;  
QIA = 0.18; 
% time constants
TIP = 20;   % time constant, peripheral insulin
VPT = 6.3;  % reassignment. volume of peripheral tissues, for insulin (6.74 on p33)

Q0 = 6.33;  % starting mass of labile insulin 
% insulin baseline values
IHC_B = IPC_B/(1-FPIC); 
IKC_B = IHC_B*(1-FKIC); 
IBC_B = IHC_B; 
ISC_B = IHC_B; 
IPT_B = IPC_B-(QIP*TIP*(IHC_B-IPC_B)/VPT); 
ILC_B = (QIH*IHC_B-QIB*IHC_B-QIK*IKC_B-QIP*IPC_B)/QIL;
% pancreatic insulin release
rPIR_B = QIL*ILC_B/(1-FLIC)-QIG*ISC_B-QIA*IHC_B; 
