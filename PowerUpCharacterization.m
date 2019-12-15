close all;
clc;

figure();
hold on;
plot(hout.Glucose_PC.time, hout.Glucose_PC.signals.values);
plot(T2Dout.Glucose_PC.time, T2Dout.Glucose_PC.signals.values);
ylabel('Glucose Concentration (mg/dL)');
xlabel('Time (min)');
title('Peripheral Capillary Glucose Concentration');
legend('Healthy','T2D');

figure();
hold on;
plot(hout.Glucagon.time, hout.Glucagon.signals.values);
plot(T2Dout.Glucagon.time, T2Dout.Glucagon.signals.values);
ylabel('Glucagon Concentration (unitless)');
xlabel('Time (min)');
title('Normalized Glucagon Concentration');
legend('Healthy','T2D');


figure();
hold on;
plot(hout.Insulin_Pancreas.time, hout.Insulin_Pancreas.signals.values);
plot(T2Dout.Insulin_Pancreas.time, T2Dout.Insulin_Pancreas.signals.values);
ylabel('Production Rate (mU/min)');
xlabel('Time (min)');
title('Pancreatic Insulin Production Rate');
legend('Healthy','T2D');

figure();
hold on;
plot(hout.Insulin_PC.time, hout.Insulin_PC.signals.values);
plot(T2Dout.Insulin_PC.time, T2Dout.Insulin_PC.signals.values);
ylabel('Insulin Concentration (mU/L)');
xlabel('Time (min)');
title('Peripheral Capillary Insulin Concentration');
legend('Healthy','T2D');