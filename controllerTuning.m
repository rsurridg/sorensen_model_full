% close all;
% clc;
% 
% output = out.output.signals.values;
% error = out.error.signals.values;
% time = out.error.time;
% 
% figure(1);
% subplot(4,1,1);
% plot(time/60,output);
% title('Output (P = 100, I = 0, D = -10)');
% xlabel('Time (min)');
% ylabel('BGV (mg/dL)');
% 
% subplot(4,1,2);
% plot(time/60, error);
% title('Error');
% xlabel('Time (min)');
% ylabel('Difference (mg/dL)');
% 
% intError = cumtrapz(time, error);
% subplot(4,1,3);
% plot(time/60, intError);
% title('Integration of Error');
% xlabel('Time (min)');
% ylabel('Area (mg*min/dL)');
% 
% dError = diff(error);
% subplot(4,1,4);
% plot(time(2:end)/60, dError);
% title('Derivative of Error');
% xlabel('Time (min)');
% ylabel('Slope (mg/dL/min)');
% 
% P = pid(100, 0, -10);
% num = [-0.004555 -8.502e-7];
% den = [1 0.0004403 1.156e-7];
% H = tf(num,den);
% 
% Y = feedback(-1*P*H,1);
% figure();
% step(Y);
% 
% figure();
% rlocus(Y);

%% YOSHIDA
close all;
% s = tf('s');
% G = 1/(s*(s+1));
% rlocus(G)
% 
% D = s + 0.8; % controller
% figure()
% rlocus(D*G) % the new plant
% % but this is PD and will accentuate noise 
% % poles move right which increases speed of system
% 
% D1 = (s+3)/(s+6);
% figure()
% rlocus(G*D1)
% 
% % move poles to improve repsonse
% D1 = (s+3)/(s+15);
% rlocus(G*D1);
% 
% D2 = (s+3)/(s+30);
% rlocus(G*D2);
close all;
clc;

s = tf('s');
P = 1;
I = 0.001;
D = 100;

%num = [-0.004555 -8.502e-7];
%den = [1 0.0004403 1.156e-7];
num = [-0.002495 -5.825e-07];
den = [1 0.0003699 8.769e-08];

H = tf(num,den);
C = P + I*1/s + D*100/(100+100/s);
figure(1)
rlocus(-C*H);

figure(2)
sys = feedback(-C*H,1);
step(sys)




