close all;
figure();
hold on;
plot(healthyTime, healthyBG);
plot(T2ucTime, T2ucBG);
plot(T2cTime, T2cBG);
title('Blood Glucose Response to Glucose Infusion');
xlabel('Time (min)');
ylabel('Blood Glucose Value (mg/dL)');
legend('Healthy', 'Diseased (Uncontrolled)','Diseased (Controlled)');
axis([0 800 110 140])

figure();
hold on;
plot(healthyTime, healthyPanc);
plot(T2ucTime, T2ucPanc);
plot(T2cTime, T2cPanc);
title('Pancreatic Response to Glucose Infusion');
xlabel('Time (min)');
ylabel('Insulin Production Rate (mU/min)');
legend('Healthy', 'Diseased (Uncontrolled)','Diseased (Controlled)');
axis([0 800 2 7])

figure()
plot(T2cTime, T2cPump);
title('Insulin Pump Response to Glucose Infusion');
xlabel('Time (min)');
ylabel('Insulin Delivery Rate (mU/min)');
axis([0 800 -5 10])
