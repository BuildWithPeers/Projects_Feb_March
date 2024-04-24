% Load the data
mass_loss_data = xlsread('bioprocess.xlsx', 'Mass loss', 'B2:E50'); % Assuming data starts from B2 to E50

% Calculate total mass loss for each run
total_mass_loss = mass_loss_data(:, 3) - mass_loss_data(:, 4);

% Calculate summary statistics of total mass loss
mean_mass_loss = mean(total_mass_loss);
median_mass_loss = median(total_mass_loss);
std_mass_loss = std(total_mass_loss);
min_mass_loss = min(total_mass_loss);
max_mass_loss = max(total_mass_loss);

% Display summary statistics
fprintf('Summary statistics of total mass loss:\n');
fprintf('Mean: %.2f\n', mean_mass_loss);
fprintf('Median: %.2f\n', median_mass_loss);
fprintf('Standard Deviation: %.2f\n', std_mass_loss);
fprintf('Minimum: %.2f\n', min_mass_loss);
fprintf('Maximum: %.2f\n', max_mass_loss);

% Box plot of total mass loss
figure;
boxplot(total_mass_loss);
title('Distribution of Total Mass Loss');
ylabel('Total Mass Loss');

% Identify step-wise contribution to mass loss
step_ids = mass_loss_data(:, 5);
unique_step_ids = unique(step_ids);
step_mass_loss = accumarray(step_ids, total_mass_loss, [], @sum);

% Plotting step-wise contribution to mass loss
figure;
bar(unique_step_ids, step_mass_loss, 'FaceColor', [0.53, 0.81, 0.98]);
title('Step-wise Contribution to Mass Loss');
xlabel('Step');
ylabel('Total Mass Loss');
xticklabels(unique_step_ids);
xtickangle(45);
grid on;
