function consumption = consumption(speed)
% Given a speed (km/h), calculate the consumption of electricity(Wh/km)
% Input: speed
%variable containing the speed to evaluate
% Output: consumption
%variable containing the estimated consumption

% Validate function input
assert(speed <= 200 && speed >= 0);

% Load data from disk
load roadster.mat

% Compute an estimate of electricity consumption at 'speed' (km/h

polynomial = spline(speed_kmph, consumption_Whpkm);
consumption = ppval(polynomial, speed);

end