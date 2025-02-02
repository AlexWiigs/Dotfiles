% Example script to test MATLAB language server

% Define the function to integrate
f = @(x) exp(-x.^2); % Gaussian function

% Integration limits
a = 0;
b = 2;

% Perform numerical integration using MATLAB's built-in function
result = integral(f, a, b);
% Display the result
disp(['The integral of exp(-x^2) from ', num2str(a), ' to ', num2str(b), ' is: ', num2str(result)]);

% Generate x values for plotting
x = linspace(-2, 2, 100);

% Compute function values
y = f(x);

% Plot the function
figure;
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x) = exp(-x^2)');
grid on;

% Save the figure
saveas(gcf, 'gaussian_plot.png');


