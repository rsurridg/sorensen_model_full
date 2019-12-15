%constants
close all; 

%insulin
V_i_B=.26;
V_i_H=.99;
V_i_G=.94;
V_i_L=1.14;
V_i_K=.51;
V_i_PC=0.74;
V_i_PF=6.74;
V_gamma=99.3;
Q_i_B=.45;
Q_i_H=3.12;
Q_i_A=.18;
Q_i_K=.72;
Q_i_P=1.05;
Q_i_G=0.72;
Q_i_L=.90;
T_i_P=20;

%Glucose
Q_bG=5.9;
V_gBF = 4.5;
V_gBC = 3.5;
T_gB=2.1;
GAMMA_B = 1; % ASSUMPTION
V_gK=6.6;
Q_gK=10.1;
T_gP=5.0;
Q_gP=15.1;
V_gPC=10.4;
V_gPF=67.4;
V_gG=11.2;
Q_gG=10.1;
Q_gH=43.7;
V_gH=13.8;
Q_gB=5.9;
Q_gL=12.6;
V_gL=25.1;
Q_gA=2.5;

r_BGU = 70;
r_RBCU = 10;
r_GGU = 20;
r_bPGU = 35;
r_bHGP = 35;
r_bHGU = 20;
r_bPGamR = 9.1;

%% Pancreas
a = 0.0482;
b = 0.9310;
K = 0.00794;
K2 = 100*K;
lambda = 0.0958;
m0 = 6.33;


%% DIABETIC

N1 = 0.00595;
N2 = 0.0467;

M_iPGU_aD = 2.551;
M_iPGU_bD = 1.66;
M_iPGU_cD = 0.69;
M_iPGU_dD = 3.454;

M_iinfHGP_aD = 1.173;
M_iinfHGP_bD = 1.073;
M_iinfHGP_cD = 0.993;
M_iinfHGP_dD = 1.164;

M_iinfHGU_aD = 0.662;
M_iinfHGU_bD = 0.731;
M_iinfHGU_cD = 0.985;
M_iinfHGU_dD = 0.493;

M_gHGU_aD = 1.855;
M_gHGU_bD = 1.85;
M_gHGU_cD = 2.047;
M_gHGU_dD = 1.244;

M_gPGU_aD = 0.897;
M_gPGU_bD = 0.103;

%% HEALTHY

% N1 = 0.00747;
% N2 = 0.0958;
% 
% M_iPGU_aD = 7.03;
% M_iPGU_bD = 6.52;
% M_iPGU_cD = 0.338;
% M_iPGU_dD = 5.82;
% 
% M_iinfHGP_aD = 1.21;
% M_iinfHGP_bD = 1.14;
% M_iinfHGP_cD = 1.66;
% M_iinfHGP_dD = 0.89;
% 
% M_iinfHGU_aD = 0;
% M_iinfHGU_bD = 2.0;
% M_iinfHGU_cD = 0.55;
% M_iinfHGU_dD = 0;
% 
% M_gHGU_aD = 5.66;
% M_gHGU_bD = 5.66;
% M_gHGU_cD = 2.44;
% M_gHGU_dD = 1.48;
% 
% M_gPGU_aD = 1;
% M_gPGU_bD = 0;

%% input signal (based on table 6.16)
clear glucoseInput;
glucoseInput(1:15) = 4700/15; % mg/min
glucoseInput(end:30) = 8620/15;
glucoseInput(end:45) = 10620/15;
glucoseInput(end:60) = 8020/15;
glucoseInput(end:75) = 5380/15;
glucoseInput(end:90) = 3260/15;
glucoseInput(end:105) = 2240/15;
glucoseInput(end:120) = 820/15;
glucoseInput(end:135) = 480/15;
glucoseInput(end:150) = 100/15;
glucoseInput(end:165) = 60/15;
glucoseInput = [zeros(1,800) glucoseInput zeros(1,800)];

% xSmooth = [0 15 30 45 60 75 90 105 120 135 150 165];
% ySmooth = [0 glucoseInput(800+x)];
% xSmooth = 800+xSmooth;
% xq = 0:1:1000;
% smooth = interp1(xSmooth, ySmooth, xq, 'spline');

fs = 1; % 1 per minute
fz = fs/2;
cutoff = 0.05; % Hz
Wn = cutoff/fz;
[B, A] = butter(3, Wn,'low');
filtGI = filter(B, A, glucoseInput);

% xq = 1:1:1500;
% y = 6000*normpdf(xq, 1000, 50);

glucoseInputTS = timeseries(glucoseInput);
figure()
plot(filtGI(800:end));
title('Glucose Infusion Waveform');
xlabel('Time (min)');
ylabel('Infusion Rate (mg/min)');
axis([0 800 0 800])



