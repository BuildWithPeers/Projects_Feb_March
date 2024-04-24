% Define the data points for the critical combinations of AEX chromatography eluate volume and CEX eluate volumes
% For demonstration purposes, let's assume some hypothetical data
aex_volume = [10, 20, 30, 40, 50];
cex_volume = [5, 10, 15, 20, 25];
mass_loss = [
    [5, 5, 5, 5, 5],
    [5, 5, 0, 0, 0],
    [5, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
];  % Hypothetical mass loss levels for different combinations

% Create the plot
figure;
imagesc(aex_volume, cex_volume, mass_loss);
colormap(gray);

% Add colorbar
colorbar;
caxis([0, max(max(mass_loss))]);  % Set color range based on the maximum value in the data

% Add labels and title
xlabel('AEX Chromatography Eluate Volume');
ylabel('CEX Eluate Volume');
title('Windows of Operation for Mass Loss');

% Set aspect ratio to auto
daspect([1,1,1]);

% Show the plot
grid off;
