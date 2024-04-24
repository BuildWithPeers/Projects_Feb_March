% Load the data
data = readtable('bioprocess.xlsx', 'Sheet', 'key process parameters');

% Drop unnecessary columns like RunNo and Titre
data(:, {'RunNo', 'Titre'}) = [];

% Calculate correlation matrix
correlation_matrix = corr(data{:,:});

% Find the index of the 'Y1' column
Y1_index = find(strcmp(data.Properties.VariableNames, 'Y1'));

% Plot correlation coefficients as a horizontal bar graph
figure;
barh(1:size(correlation_matrix, 2), correlation_matrix(Y1_index, :));
title('Correlation between columns and Y1');
xlabel('Correlation coefficient');
ylabel('Columns');
yticks(1:size(correlation_matrix, 2));
yticklabels(data.Properties.VariableNames);  % Display variable names on y-axis
grid on;
