%%%%%%% Operation Error Scenario %%%%%%%%
%%% average delay vs different berthing time
figure();
t = [45 67.5 90 112.5 135];
avg_delay_time = [4.3270 8.4500 11.0188 19.3182 35.0194];
f1 = fit(t', avg_delay_time', 'exp1'); 
scatter(t,avg_delay_time,70,'s'); hold on;
plot(f1);

set(gca, 'FontSize',18); xlim([30,150]);
legend('actual data', 'fitted exponential','Location','southeast');
xticks(t);
ylabel('Steady state delay mean (Minutes)'); 
xlabel('Berthing time mean (Minutes)');
title('Steady state delay mean vs berthing time mean');

%%% average delay vs different unloading time
figure();
t = [120 150 180 210 240];
avg_delay_time = [4.3270 9.6910 25.3338 53.9302 92.6978];
f2 = fit(t', avg_delay_time', 'exp1'); 
scatter(t,avg_delay_time,70,'s'); hold on;
plot(f2);
set(gca, 'FontSize',18); 
legend('actual data', 'fitted exponential','Location','southeast');
xticks(t);
ylabel('Steady state delay mean (Minutes)'); 
xlabel('Loading time mean (Minutes)');
title('Steady state delay mean vs loading time mean');

figure('Position', [0 0 600 400]);


%%%%%%% Earthquake Scenario %%%%%%%%

% High arrival rate

% Configurations
% SIM_TIME = 168   
% UNLOAD_SPEED = 1
% average traveling time for ships of type 1 to 3
% AVG_TRAVEL_TYPE1_3 = 5.0

% 10 cranes
% 5 replications
dock_11 = [15.020979637279572; 398.65425707196573; 28.60030899267182;...
    42.2305375146251; 14.18655710701507];
dock_12 = [17.5329579802744; 13.552307798664263; 10.109897840439118; ...
    5.781960703782836; 39.590057865781795];
dock_13 = [2.5066235811493547; 40.30252479211185; 14.639167396820884; ...
    9.13197479961018; 2.218991017655124];
dock_14 = [2.181436273067141; 36.775248910975506; 3.197921799230655; ...
    1.0290652353378158; 7.256463122271772];
dock_15 = [0.19757892668518628; 1.1419388480926382; 0; 0.20317245928043948; ...
    6.037707989167597];
num_docks = [11 12 13 14 15];
plot(num_docks, [mean(dock_11) mean(dock_12) ...
    mean(dock_13) mean(dock_14) mean(dock_15)], ...
    '-s','LineWidth',1.5,  'MarkerSize',10);
hold on;

% 3 cranes
% 5 replications
dock_11 = [113.1446604506742; 88.14333831529144; 248.8745943379638; ...
    20.29802905274893; 50.28088048946776];
dock_12 = [37.437928655313364; 32.91178402287052; 29.756853781929983; ...
    26.631517359595104; 19.07249596818818];
dock_13 = [10.385300158367754; 36.886280479224624; 78.93494436239463; ...
    10.272045797205609; 11.823020567666813];
dock_14 = [27.259847264752473; 9.983238484672324; 21.076891011643745; ...
    50.551146523374484; 5.374178294244823];
dock_15 = [9.810227641227508; 8.64753713532875; 4.042160542187087; ...
    8.273267152913647; 8.462081431265055];

plot(num_docks, [mean(dock_11) mean(dock_12) ...
    mean(dock_13) mean(dock_14) mean(dock_15)],...
    '-s','LineWidth',1.5,  'MarkerSize',10);

% 2 cranes
% 5 replications
dock_11 = [184.7478825826543; 103.89653474322105; 185.90415559812433; ...
    149.32600045539542; 284.3882133107386];
dock_12 = [76.32812802843623; 145.57851465076308; 241.77026174176865; ...
    171.80933287196706; 81.69415263378427];
dock_13 = [206.12735998129008; 113.73242615906905; 37.7900777432735; ...
    35.51688777809151; 68.39277976283552];
dock_14 = [68.23898546402066; 177.02563172033038; 72.30684779892019; ...
    72.78758510804141; 55.403440147908995];
dock_15 = [156.239004080642; 43.06775735141921; 66.64110107470833; ...
    41.81268519630409; 113.68336967070076];
plot(num_docks, [mean(dock_11) mean(dock_12) ...
    mean(dock_13) mean(dock_14) mean(dock_15)],...
    '-s','LineWidth',1.5,  'MarkerSize',10);

legend('10 cranes', '3 cranes', '2 cranes');
set(gca, 'FontSize',18); 
title('Average berthing delay vs number of berths');
ylabel('Minutes'); xlabel('Number of berths');