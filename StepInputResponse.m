close all;
clc;

time_input = 375;
ind = sum(out.Insulin_Input.time<time_input);
time = out.Insulin_Input.time(ind:end)/60 - time_input/60;
input = out.Insulin_Input.signals.values(ind:end);

figure(1);
hold on;
signal = out.Glucose_PC.signals.values(ind:end);
% yyaxis left;
ylabel('Blood Glucose Value (mg/dL)');
plot(time, signal);
%axis([min(time) max(time) 0 max(signal)*1.1]);
% 
% yyaxis right;
% plot(time, input);
% ylabel('Insulin Infusion Rate (mU/min)');
% axis([min(time) max(time) 0 40]);

title('Blood Glucose Response to Insulin Infusion');
xlabel('Time (hours)');

figure(2);
hold on;
signal = out.Glucagon.signals.values(ind:end);
yyaxis left;
ylabel('Glucagon (unitless)');
plot(time, signal);
axis([min(time) max(time) 0 max(signal)*1.1]);

yyaxis right;
plot(time, input);
ylabel('Insulin Infusion Rate (mU/min)');
axis([min(time) max(time) 0 40]);

title('Glucagon Response to Insulin Infusion');
xlabel('Time (hours)');


figure(3);
hold on;
signal = out.Insulin_Pancreas.signals.values(ind:end);
yyaxis left;
ylabel('Pancreatic Insulin Release Rate (mU/min)');
plot(time, signal);
axis([min(time) max(time) 0 max(signal)*1.1]);

yyaxis right;
plot(time, input);
ylabel('Insulin Infusion Rate (mU/min)');
axis([min(time) max(time) 0 40]);

title('Insulin Output from Pancreas');
xlabel('Time (hours)');

