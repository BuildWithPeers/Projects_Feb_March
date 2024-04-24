% Define parameters and assumptions
n_iterations = 400;
bioreactor_volume = 10000;  % L
titre_mean = 4;  % g/L
titre_std_dev = 0.1 * titre_mean;  % 10% fluctuation
step_yield_mean = [0.95, 0.95, 0.95, 0.95, 0.95, 0.95, 0.95, 0.95];  % Step yields
eluate_volume_mean = [100, 100, 100, 100, 100, 100, 100, 100];  % Eluate volumes
filtration_flux_mean = [50, 50, 50, 50, 50, 50, 50, 50];  % Filtration flux rates

% Perform Monte Carlo simulation iterations
mass_loss = zeros(n_iterations, 8);
pool_volumes = zeros(n_iterations, 8);
for i = 1:n_iterations
    % Simulate fluctuations
    titre = normrnd(titre_mean, titre_std_dev);
    step_yields = normrnd(step_yield_mean, 0.02);  % Assume 2% standard deviation in step yields
    eluate_volumes = normrnd(eluate_volume_mean, 2);  % Assume 2 L standard deviation in eluate volumes
    filtration_flux = normrnd(filtration_flux_mean, 2);  % Assume 2 flux standard deviation

    % Calculate mass loss and pool volumes at each step
    mass_in = bioreactor_volume * titre;
    for j = 1:8
        mass_out = mass_in * step_yields(j);
        mass_loss(i, j) = mass_in - mass_out;
        pool_volumes(i, j) = eluate_volumes(j);

        % Update mass in for next step
        mass_in = mass_out;
    end
end

% Calculate anticipated mean loss due to step yield alone
anticipated_mean_loss = mean(bioreactor_volume * titre_mean * (1 - step_yield_mean));

% Plot distribution of mass loss and pool volumes
figure;
boxplot(mass_loss, 'Colors', 'b', 'Symbol', '', 'Widths', 0.7, 'Labels', 1:8, 'Whisker', 0);
hold on;
plot(xlim, [anticipated_mean_loss, anticipated_mean_loss], 'b--', 'LineWidth', 1.5);
ylabel('Mass Loss (kg)');
xlabel('Process Step');

yyaxis right;
boxplot(pool_volumes, 'Colors', 'r', 'Symbol', '', 'Widths', 0.7, 'Positions', 1.1:1:8.1, 'Whisker', 0);
ylabel('Pool Volume (L)');

title('Distribution of Mass Loss and Pool Volumes for Each Process Step');
legend('Mass Loss', 'Anticipated Mean Loss', 'Pool Volume');
hold off;
