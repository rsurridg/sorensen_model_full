close all;
clc;

length_recording = 1500;
time_input = 800;

ind = sum(out.Insulin_Input.time<time_input);
time = out.Insulin_Input.time(ind:end)/60 - time_input/60;
input = out.Insulin_Input.signals.values(ind:end);

figure(1);
hold on;
signal = out.Glucose_PC.signals.values(ind:end);
signal = signal;
signal = signal - signal(1);
ylabel('Blood Glucose Value (mg/dL)');
plot(time*60, signal);

title('Blood Glucose Response to Insulin Infusion');
xlabel('Time (minutes)');

%% downsample algorithm
n = length_recording - time_input;
signalDS = zeros(1,n);
inputDS = zeros(1,n);
time_min = time.*60;
for i = 1:n
    signalDS(i) = signal(sum(time_min<i));
    inputDS(i) = input(sum(time_min<i));
end
    

data = iddata(signalDS', inputDS', 60);
sys = tfest(data, 2);

[Y,T] = step(sys,0:60:n*60); % every 60 seconds up to 700 minutes
plot(T/60, Y); % plot minutes on x axis

legend('Model Response', '2nd-Order Approximation Response');
axis([0 700 -10 0])
