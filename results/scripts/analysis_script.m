%%%%%% Throughput plots
tp_data = csvread('output-1.csv',1,0); 
time = tp_data(:,1)/60; % time stamp when throughput increases by 1
simulation_time = ceil(max(time));

replication = 1;
hourly_tp = zeros(simulation_time,10);
cur_time = time(1); prev_time = 0;
i = 2;
while true
    tp_list = zeros(simulation_time,1);
    while cur_time > prev_time && i <= length(time)
        prev_time = cur_time; cur_time = time(i);
        i = i + 1;
        tp_list(ceil(cur_time)) = tp_list(ceil(cur_time)) + 1;
    end
    hourly_tp(:,replication) = tp_list;
    replication = replication + 1; 
    if i >= length(time)
        break
    end
    prev_time = cur_time; cur_time = time(i); i = i + 1;
end

figure('Position', [0 0 900 300]); subplot(1,2,1);
avg_hourly_tp = mean(hourly_tp, 2);
plot(linspace(1,simulation_time,simulation_time),  ...
    avg_hourly_tp, 'LineWidth', 1.5);
xlim([0 simulation_time]); ylim([0 0.8]); 
set(gca, 'FontSize',15);  ylabel('Hourly throughput');
xlabel('Hour'); title('Averaged process of N_1, N_2 ... N_{168}');

subplot(1,2,2);
move_avg = movmean(avg_hourly_tp, 20);
plot(linspace(1,simulation_time,simulation_time),  ...
    move_avg, 'LineWidth', 2); hold on;
line([50 50],[0 0.8],'Color','red','LineStyle','--'); 
text(60,0.1,'warm up period L = 50','Color',...
    [0.8500 0.3250 0.0980],'FontSize',15); 
xlim([0 simulation_time]);  ylim([0 0.8]); set(gca, 'FontSize',15); 
title('Moving average with window size 20');

% warm up time L = 50
Xs = mean(hourly_tp(51:simulation_time,:),1);
bar_X = mean(Xs)
left_CI = bar_X - tinv(0.95,9)*(var(Xs)/10)^0.5
right_CI = bar_X + tinv(0.95,9)*(var(Xs)/10)^0.5

%%%%%% Average delay plots
file = 'simpy_results13.csv'; 
delay_data = csvread(file,1,0); 
time = delay_data(:,1)/60; % time stamp when throughput increases by 1
delaytime = delay_data(:,2);
simulation_time = ceil(max(time));

replication = 1;
hourly_delay = zeros(simulation_time,10);
cur_time = time(1); prev_time = 0;
i = 2;
while true
    dt_list = zeros(simulation_time,1);
    while cur_time > prev_time && i <= length(time)
        prev_time = cur_time; cur_time = time(i);
        if ceil(cur_time) == ceil(prev_time)
            dt_list(ceil(cur_time)) = dt_list(ceil(cur_time))*0.5 + ...
                delaytime(i)*0.5;
        else
            dt_list(ceil(cur_time)) = dt_list(ceil(cur_time)) + ...
                delaytime(i);
        end
        i = i + 1;
    end
    hourly_delay(:,replication) = dt_list;
    replication = replication + 1; 
    if i >= length(time)
        break
    end
    prev_time = cur_time; cur_time = time(i); i = i + 1;
end

avg_hourly_delay = mean(hourly_delay, 2);
move_avg = movmean(avg_hourly_delay, 200);

figure('Position', [0 0 1200 300]); subplot(1,2,1);
plot(linspace(1,simulation_time,simulation_time),  ...
    avg_hourly_delay, 'LineWidth', 1.5);
xlim([0 simulation_time]); set(gca, 'FontSize',18);
ylabel('Averaged delay (Minutes)'); 
xlabel('Hour'); title('Averaged delay in each hour');

subplot(1,2,2);
plot(linspace(1,simulation_time,simulation_time),  ...
    move_avg, 'LineWidth', 1.5); hold on;
ylim([-5 15]); xlim([0 simulation_time]); set(gca, 'FontSize',18);
ylabel('Averaged delay (Minutes)');
xlabel('Hour'); title('Moving average');

line([150 150],[-5 15],'Color','red','LineStyle','--'); 
text(160,0,'warm up period L = 150','Color',...
    [0.8500 0.3250 0.0980],'FontSize',18); 

Xs = mean(hourly_delay(151:simulation_time,:),1);
bar_X = mean(Xs)
left_CI = bar_X - tinv(0.90,9)*(var(Xs)/10)^0.5
right_CI = bar_X + tinv(0.90,9)*(var(Xs)/10)^0.5