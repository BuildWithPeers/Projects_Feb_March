
EV1 = [2.36554, 2.08287, 1.93799, 1.21221, 2.22931, 2.13673, 1.24494, 1.61992, 2.40288, 1.40261, 2.12067, 1.87265, 1.29159, 1.08204, 2.65424, 2.18293, 2.18797, 1.54297, 2.51335, 1.97438, 2.01828];

Y1 = [84.91797, 85.77128, 87.36006, 87.72694, 90.72414, 90.2181, 86.13626, 87.95716, 85.08818, 90.65543, 90.0101, 87.86462, 88.94918, 83.03483, 84.27276, 91.2687, 91.60298, 88.34914, 85.40288, 90.19858, 89.02944];


UF3AvgFlux =  [97.47493, 99.23001, 95.52086, 86.75288, 89.83754, 105.08732, 85.99978, 90.56311, 92.11887, 102.62219, 105.20748, 106.17971, 103.54518, 103.49726, 107.53401, 109.61865, 99.42103, 105.74827, 99.68153, 85.83174, 95.97197];
UF3PermFlux = [52.64303, 53.52266, 51.43964, 50.30842, 49.0443, 49.20855, 53.53252, 53.70005, 53.20741, 53.22516, 49.54031, 50.66363, 52.85455, 50.77773, 54.09523, 54.06674, 48.79136, 53.43239, 52.07104, 49.97967, 49.417];
UF3OverFlux =  [55.23911, 56.21756, 54.40987, 51.82582, 54.8879, 55.46052, 58.11099, 56.74458, 57.218, 58.08859, 57.82419, 54.66956, 57.29907, 51.68449, 54.48285, 57.30273, 52.36988, 52.77908, 56.13141, 57.14855, 56.82212];

% Create 7 subplots
figure('Position', [100, 100, 800, 1000]);

% Plot 1: Yield (Y) vs. Elution Volume (EV)
subplot(7, 1, 1);
barh(EV1, Y1);
title('Yield (Y) vs. Elution Volume (EV)');
xlabel('Yield (Y)');
ylabel('Elution Volume (EV)');

% Plot 2: Average Flux Rate (AvgFlux) vs. Elution Volume (EV)
subplot(7, 1, 2);
barh(EV1, UF3AvgFlux);
title('Average Flux Rate (AvgFlux) vs. Elution Volume (EV)');
xlabel('Average Flux Rate (AvgFlux)');
ylabel('Elution Volume (EV)');

% Plot 3: Permeate Flux Rate (PermFlux) vs. Elution Volume (EV)
subplot(7, 1, 3);
barh(EV1, UF3PermFlux);
title('Permeate Flux Rate (PermFlux) vs. Elution Volume (EV)');
xlabel('Permeate Flux Rate (PermFlux)');
ylabel('Elution Volume (EV)');

% Plot 4: Overconcentration Flux Rate (OverFlux) vs. Elution Volume (EV)
subplot(7, 1, 4);
barh(EV1, UF3OverFlux);
title('Overconcentration Flux Rate (OverFlux) vs. Elution Volume (EV)');
xlabel('Overconcentration Flux Rate (OverFlux)');
ylabel('Elution Volume (EV)');

% Plot 5: Yield (Y) vs. Average Flux Rate (AvgFlux)
subplot(7, 1, 5);
barh(UF3AvgFlux, Y1);
title('Yield (Y) vs. Average Flux Rate (AvgFlux)');
xlabel('Yield (Y)');
ylabel('Average Flux Rate (AvgFlux)');

% Plot 6: Yield (Y) vs. Permeate Flux Rate (PermFlux)
subplot(7, 1, 6);
barh(UF3PermFlux, Y1);
title('Yield (Y) vs. Permeate Flux Rate (PermFlux)');
xlabel('Yield (Y)');
ylabel('Permeate Flux Rate (PermFlux)');

% Plot 7: Yield (Y) vs. Overconcentration Flux Rate (OverFlux)
subplot(7, 1, 7);
barh(UF3OverFlux, Y1);
title('Yield (Y) vs. Overconcentration Flux Rate (OverFlux)');
xlabel('Yield (Y)');
ylabel('Overconcentration Flux Rate (OverFlux)');

% Adjust layout
sgtitle('Relationships Between Variables', 'FontSize', 16);

% Show the plots
