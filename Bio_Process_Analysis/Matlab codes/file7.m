% Load the data
mass_loss_data = xlsread('bioprocess.xlsx', 'Mass loss', 'B2:D50'); % Assuming data starts from B2 to D50

% Calculate total mass loss for each run
total_mass_loss = mass_loss_data(:, 1) - mass_loss_data(:, 2);

% Extract StepID data
step_ids = mass_loss_data(:, 3);

% Identify step-wise contribution to mass loss
unique_step_ids = unique(step_ids);
step_mass_loss = zeros(size(unique_step_ids));
for i = 1:numel(unique_step_ids)
    step_mass_loss(i) = sum(total_mass_loss(step_ids == unique_step_ids(i)));
end

% Plotting step-wise contribution to mass loss
bar(unique_step_ids, step_mass_loss, 'FaceColor', [0.53, 0.81, 0.98]);
title('Step-wise Contribution to Mass Loss');
xlabel('Step');
ylabel('Total Mass Loss');
xticklabels(unique_step_ids);
xtickangle(45);
grid on;
