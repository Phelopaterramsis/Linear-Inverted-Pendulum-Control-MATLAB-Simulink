% Define the transfer function numerator and denominator coefficients
num = [0.09995 0];              % Numerator coefficients
den = [1, 0.4069, -2.55095, 0.8628];        % Denominator coefficients

% Create the transfer function object
sys = tf(num, den);

% Plot the root locus
rlocus(sys);
