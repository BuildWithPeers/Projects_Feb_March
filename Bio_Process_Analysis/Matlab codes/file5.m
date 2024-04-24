% Load the data
data = readtable('bioprocess.xlsx', 'Sheet', 'key process parameters');

% Drop unnecessary columns like RunNo
data(1, :) = [];

% Separate features (X) and target variable (y)
X = data{:, ~strcmp(data.Properties.VariableNames, 'Y1')};
y = data.Y1;

% Split the data into training and testing sets
rng(42); % Set random seed for reproducibility
cv = cvpartition(size(X, 1), 'HoldOut', 0.2);
X_train = X(cv.training,:);
y_train = y(cv.training);
X_test = X(cv.test,:);
y_test = y(cv.test);

% Check dimensions of X_train and y_train
fprintf('Size of X_train: %d rows, %d columns\n', size(X_train));
fprintf('Size of y_train: %d rows, %d columns\n', size(y_train));

% Check for missing values in X_train and y_train
fprintf('Number of missing values in X_train: %d\n', sum(isnan(X_train(:))));
fprintf('Number of missing values in y_train: %d\n', sum(isnan(y_train)));

% Check data types of X_train and y_train
fprintf('Data type of X_train: %s\n', class(X_train));
fprintf('Data type of y_train: %s\n', class(y_train));

% Train Decision Tree regressor
dt_regressor = fitrtree(X_train, y_train);

% Train Neural Network regressor
nn_regressor = fitrnet(X_train, y_train); % Remove transpose from X_train

% Make predictions
dt_preds = predict(dt_regressor, X_test);
nn_preds = predict(nn_regressor, X_test);

% Evaluate models
dt_rmse = sqrt(mean((y_test - dt_preds).^2));
dt_r2 = 1 - sum((y_test - dt_preds).^2) / sum((y_test - mean(y_test)).^2);
nn_rmse = sqrt(mean((y_test - nn_preds).^2)); % Remove transpose from nn_preds
nn_r2 = 1 - sum((y_test - nn_preds).^2) / sum((y_test - mean(y_test)).^2);

fprintf('Decision Tree Regression:\n');
fprintf('RMSE: %.4f\n', dt_rmse);
fprintf('R^2 Score: %.4f\n\n', dt_r2);

fprintf('Neural Network Regression:\n');
fprintf('RMSE: %.4f\n', nn_rmse);
fprintf('R^2 Score: %.4f\n', nn_r2);

% Plotting
figure;
subplot(1, 2, 1);
scatter(y_test, dt_preds);
hold on;
plot(y_test, y_test, 'r--');
hold off;
xlabel('Actual Y1');
ylabel('Predicted Y1');
title('Decision Tree Regression');
legend('Predicted vs. Actual', 'Ideal Fit', 'Location', 'northwest');
grid on;

subplot(1, 2, 2);
scatter(y_test, nn_preds);
hold on;
plot(y_test, y_test, 'r--');
hold off;
xlabel('Actual Y1');
ylabel('Predicted Y1');
title('Neural Network Regression');
legend('Predicted vs. Actual', 'Ideal Fit', 'Location', 'northwest');
grid on;
