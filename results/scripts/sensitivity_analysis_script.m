%%% average delay vs different berthing time
figure();
avg_delay_time = [4.3270 8.4500 11.0188 19.3182 35.0194];
plot([45 67.5 90 112.5 135], avg_delay_time, '-s','LineWidth',2, 'MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]); 
set(gca, 'FontSize',18);
xticks([45 67.5 90 112.5 135]);
ylabel('Steady state delay mean (Minutes)'); 
xlabel('Berthing time mean (Minutes)');
title('Steady state delay mean vs berthing time mean');

%%% average delay vs different unloading time
figure();
avg_delay_time = [4.3270 9.6910 25.3338 53.9302 92.6978];
plot([120 150 180 210 240], avg_delay_time, '-s','LineWidth',2, 'MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]); 
set(gca, 'FontSize',18);
xticks([120 150 180 210 240]);
ylabel('Steady state delay mean (Minutes)'); 
xlabel('Loading time mean (Minutes)');
title('Steady state delay mean vs loading time mean');