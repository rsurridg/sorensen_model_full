close all;
clc;

length_recording = 1500;
time_input = 800;

ind = sum(out.Glucose_Input.time<time_input);
time = out.Glucose_Input.time(ind:end) - time_input;
input = squeeze(out.Glucose_Input.signals.values(ind:end));

%% BG
figure(1);
hold on;
signal = out.Glucose_PC.signals.values(ind:end);

yyaxis left;
ylabel('Blood Glucose Value (mg/dL)');
plot(time, signal);
title('Closed-Loop BGV Response to Glucose Infusion');
xlabel('Time (minutes)');
axis([min(time) max(time) 0 300]);

yyaxis right;
plot(time, input);
ylabel('Glucose Infusion Rate (mg/min)');
axis([min(time) max(time) 0 800]);

%% PANCREATIC INSULIN

figure(2);
hold on;
signal2 = out.Insulin_Pancreas.signals.values(ind:end);

yyaxis left;
ylabel('Insulin Production Rate (mU/min)');
plot(time, signal2);
title('Closed-Loop Pancreatic Response to Glucose Infusion');
xlabel('Time (minutes)');
axis([min(time) max(time) 0 10]);

yyaxis right;
plot(time, input);
ylabel('Glucose Infusion Rate (mg/min)');
%axis([min(time) max(time) 0 800]);

%% CONTROLLER OUTPUT
figure(3);
hold on;
signal3 = out.Controller_Output.signals.values(ind:end);

yyaxis left;
ylabel('Insulin Pump Rate (mU/min)');
plot(time, signal3);
title('Controller Response to Glucose Infusion');
xlabel('Time (minutes)');
%axis([min(time) max(time) -5 50]);

yyaxis right;
plot(time, input);
ylabel('Glucose Infusion Rate (mg/min)');
%axis([min(time) max(time) 0 1000]);

